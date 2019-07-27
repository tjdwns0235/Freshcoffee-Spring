package com.freshcoffee.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	//로깅을 위한 변수

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// uuid 발급
		UUID uid = UUID.randomUUID(); // 이름이 중복 되면 안되니까 uuid의랜덤 36자리로 파일이름 중복 방
		String savedName = uid.toString() + "_" + originalName;
		// 업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath); //calcPath는 날짜 폴더 만들어준다
		File target = new File(uploadPath + savedPath, savedName);
		// DROP/2019/07/12,uuid 즉 여기에서 파일을 넣음
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		// 파일의 확장자 검사
		// a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1); // 라이언.jpg 점을 찾아서 +1 커서를 jpg를 잘라서 그것을 formatname에 넣는다 
		String uploadedFileName = null;
		// 이미지 파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
//아이콘 생성
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		// 아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴
		// File.separatorChar : 디렉토리 구분자
		// 윈도우 \ , 유닉스(리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		log.info("uploadPath>>>>"+uploadPath);
		log.info("path>>>"+path);
		log.info("fileName"+ fileName);
		// 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName)); // 원본파일이 담겨있다 
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // Scalr은 썸네일을 만들어주는데사이즈를 줄여준다 그리고 100픽셀단위로 만들어
		// 썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		//Drop + /2019/07/12 + / + s_ + filename 변수 생
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 썸네일 생성
		//원본파일의 resize(썸네일 이미지), 
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();  //cal에 오늘 날짜가들어 있 2019. 07.12
		String yearPath = File.separator // = (/2019)
				+ cal.get(Calendar.YEAR); // 2019
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);// 월을 2자리로바꾸어주고 month는 0~11자리로 들어오므로 1자리 추가 해준
		// yearPath = /2019 + / + 00(06)+1=(07) = /2019/07  이 함수가 원래 7월이 아니라 -1달로 들어옴
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	    //                 month + / + 12일+ 
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		return datePath; // datePath = /2019/07/12
	}

	private static void makeDir(String uploadPath
			, String... paths) {
		//디렉토리가 존재하면 skip
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}
}