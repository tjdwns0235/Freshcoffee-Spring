<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--   <%@ include file="${path}../iclude/header.jsp"%> --%>
  <%--   <c:if test="${sessionScope.loginUser == null}">
 	   <script>
 	   		alert("로그인 하 신 후 사용하세요. ");
 	   		location.href="${path}/boardList.freshcoffee?message=nologin";
 	   </script>
 	</c:if> --%>
 	<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<link rel="stylesheet" href="${path}/resources/lightbox/css/lightbox.css">
<script type="text/javascript" src="${path}/resources/lightbox/js/lightbox.js"></script>
<meta charset="UTF-8">
<title>게시판 등록</title>
<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	.content {
		border: 1px solid #fec9c9;
		margin: 200px auto;
		width: 750px;
		text-align: left;
		border-radius: 5px;
		padding: 20px;
		border-top: 25px solid #fec9c9!important;
		padding-bottom: 40px;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		height: 900px;
	}
	h3 {
		margin-left: 25px;
	}
	h4 {
		margin-top:30px;
		margin-left: 25px;
		margin-bottom: 10px;
	}
	.title_input input {
		margin:0 25px 30px 0;
		margin-left: 25px;
		width: 690px;
		height: 25px;
	}
	.insert_Content {
		margin-left: 25px;
	}
	.insert_Content textarea {
		width:690px;
		height: 400px;
	}
	label {
		font-size: 17px;
		color: black;
		display: block;
	}
	.writer {
	 	margin-left: 25px;
	 	margin-bottom: 10px;
	}
	.content_MiniTitle input {
		width: 690px;
		height: 25px;
	}
	.writer {
		margin-top: 20px;
	}
	.update_Btn {
		float: right;
		margin-right: 25px;
		background-color: pink;
	}
	.file_Area {
		margin: 30px 0 0 0;
	}
	.file_Area input {
		margin-left:25px;
	}
	.update_Btn {
		width: 105px;
		height:30px;
	}
	.update_Btn > a {
		text-decoration: none;
		background-color: #FADAD8;
		display: inline-block;
		width:100px;
		height: 25px;
		color: white;
		text-align:center;
		line-height:25px;
	}
	.update_Btn > a:hover {
		background-color:#00dffc;
	}
	.form-group .board_div {
		border: 1.5px dashed #dadada;
		text-align: center;
		height: 130px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #515151;
	}
	.uploadedList {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
</style>
</head>
<body>
	<header>
		
	</header>
	<section class="content">
		<div class="box">
			<form action="${path}/board/create" name="frm_board" id="frm_board" method="POST" > <!--첨부파일 보내려면 방식이 POST여야 함!  -->
				<div class="insert_title">
					<h3>Q & A</h3>
					<label for="title"><h4>제목</h4></label>
					<span class="title_input"><input type="text" name="title" id="title" placeholder="제목을입력해주세요"></span>
					<span class="boardinsert_err"></span>
				</div>
	
				<div class="insert_Content">
					<label for="content"><div class="content_MiniTitle">내용</div></label>
					<textarea name="content" id="registerInsert" placeholder="내용을 입력해주세요!"></textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "registerInsert",
						 sSkinURI: "<%=request.getContextPath()%>/resources/smarteditor/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
						});
					</script>	
				</div>
				
				<div class="writer">
					<label for="writer"><div>작성자</div></label>
					<span class="content_MiniTitle">
						<input type="text" value="${sessionScope.userid}" readonly="readonly" name="writer">
					</span>
				</div>
				

			<div class="file_Area">
				<div class="write_input_wrap form-group">
					<div class="board_div fileDrop">
						<p>
							<i class="fas fa-paperclip"></i>첨부파일을 드래그해주세요 
						</p>
					</div>
				</div>
				<div class="write_input_wrap">
					<ul id="uploadedList" class="mailbox-attachments clearfix uploadedList">
					
					</ul>
				</div>
				
				<button type="button" class="update_Btn">게시글등록</button>
			</div>
			</form>
		</div>
		
	</section>
	<footer>
		<%@ include file="../include/footer.jsp" %>
	</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script id="fileTemplate" type="text/x-handlebars-template">
<li>
    <div class="mailbox-attachment-icon has-img">
        <center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
    </div>
    <div class="mailbox-attachment-info">
        <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
            <i class="fa fa-paperclip"></i> {{originalFileName}}
        </a>
        <span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
            <i class="fas fa-times"></i>
        </span>
    </div>
</li>
</script>
<script type="text/javascript">
	//Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	// 수정시 로컬드라이브에서 삭제할 기존 첨부파일 목록
	var deleteFileList = new Array();
	
	$(document).ready(function(){
		
		// 등록 & 수정 페이지 디자인
		var bno = '${one.bno}';
		if(bno == '') {
			// 게시글 등록
		} else {  // 게시글 수정
			var str='';
			str += "<input type='hidden' name='bno' value='" + bno + "'>";
			$("#frm_board").append(str);
		}
		
		// 첨부파일 목록 출력
		listAttach();
		
		// 답글이면 title 수정 못하게 막음
		var re_level = "${one.re_level}";
		if(re_level > 0) {
			$('#board_title').attr('readonly', 'readonly');
		}
		
		$(document).on("click", ".update_Btn", function(){
			oEditors.getById["registerInsert"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var title = $("#title").val();
			var content = $("#registerInsert").val();
			
			 if(title == "<p><br></p>") {
				alert("제목을 입력해주세요");
				$("#title").focus();
				return false;
			}else if(content == "<p><br></p>") {
				alert("내용을 입력해주세요");
				return false;
				$("#registerInsert").focus();
			}
			 var str="";
				// uploadedList 내부의 .file 태그 각각 반복
				$("#uploadedList .file").each(function(i){
					console.log(i);
					//hidden 태그 구성
					str += "<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";
				});
				
				// 로컬드라이브에 저장되어있는 해당 게시글 
				// 첨부파일 삭제
				if(deleteFileList.length > 0) {
					$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
				}
			$("#frm_board").append(str);	
			 $('#frm_board').submit();
			});
			// Drag & Drop 기본효과 막음
			$('.fileDrop').on('dragenter dragover', function(e){
				e.preventDefault();
			});
			// 1. 파일을 드래그 앤 드롭 했을때
			$('.fileDrop').on('drop', function(e){
				// 2. Html은 드래그 했을때 파일을 불러오므로 그래그인드롭시 파일 실행을 막을때
				e.preventDefault();
				
				//	Ajax 파일 -> D:\\upload
				var files = e.originalEvent.dataTransfer.files; //드래그에 전달된 첨부파일 전부
				var file = files[0]; //그중 하나만 꺼내옴
				
				// 폼 데이터에 첨부파일 추가
				var formData = new FormData();	//폼 객체
				formData.append("file", file);	//폼에 파일변수 추가
				// 서버에 파일 업로드(백그라운드에서 실행됨) 
				// append와 insert는 추가인데 차이점은 append는 무조건 맨 하단 즉 마지막에 추가가 된다 리눅스도 마찬가지다
				// append기능이 있다라는건 보통 중간에 추가가 안 되고 무조건 마지막에 추가가된다라는것이다
				// contentType: false => multipart/form-data로 처리
				$.ajax({
					url:"${path}/upload/uploadAjax",
					data: formData,
					dataType: "text",
					processData: false,
					contentType: false,
					type: "post",
					success: function(data){
						console.log(data);
						//data: 업로드한 파일정보(썸네일 이름)와 http 상태코드
						printFiles(data);  // 첨부파일 출력 메서드 호출
					}
				})
				
			});
			
			// 첨부파일 삭제 함수
			$(".uploadedList").on("click", ".delBtn", function(event) {
				var bno = '${one.bno}';
				var that = $(this);
				if(bno == 0) { // 게시글 등록
					$.ajax({
						url: "${path}/upload/deleteFile",
						type: "post",
						data: { fileName: $(this).attr("data-src") },
						dataType: "text",
						success: function(result) {
							if(result == "deleted") {
								that.parents("li").remove();
							}
						}, error: function() {
							alert("System Error!!!");
						}
					});	
				} else {
					/* 
						첨부파일 x버튼 클릭시 바로바로 드라이브에서 삭제해버리면
						수정작업중 수정을 취소했을 때 기존에 파일이 사라지는 문제가 발생
						따라서 삭제를 눌렀을 때 화면단에서는 삭제가 되지만 드라이브와 DB에서
						삭제하지 않고 삭제목록(list)을 따로 저장해 둔 후 실제 유저가
						수정버튼을 클릭했을 때 form태그에 append하고 가져가서 파일을 삭제
						및 수정
					*/
					var arr_size = deleteFileList.length;
					deleteFileList[arr_size] = $(this).attr("data-src");
					$(this).parents("li").next("input").remove();
					$(this).parents("li").remove();
					/* for (var i = 0; i <= deleteFileList.length; i++)
					console.log(deleteFileList[i]); */
				}
			});
		 
	
	
	
		/* $(document).on("click", ".btn-file", function(){
			$("#uploadfile").click();
		}); */
		
		/* $(document).on("change", "#uploadfile", function(){
			var filesize = $(this)[0].files;
			
			if(filesize.length < 1) {
				$('#file_name').text("선택된 파일 없음");
				$("#close_file_btn").css('display', 'none');
			}else {
				var filename = this.files[0].name;
				var size = this.files[0].size;
				var maxSize = 30 * 1024 * 1024;
				
				if(size > maxSize){	
					alert("첨부파일 사이즈는 30MB 이내로 등록 가능합니다");
					$("#file_name").text("선택된 파일 없음");
					$("#uploadfile").val(""); //30mb이상이여도 올려버린다 따라서 초기화를 해줘야 한다
					$("#now_file_size").text("");
				} else {
					$("#file_name").text(filename);
					var formSize = size/(1024*1024);
					$("#now_file_size").text("("+formSize.toFixed(2) + "mb)");
					$("#close_file_btn").css("display", "block");
				}
			}
		}); */
		
		/* $(document).on("click", '#close_file_btn', function(){
			$("#uploadfile").replaceWith($("#uploadfile").clone(true));
			$("#uploadfile").val("");
			$('#now_file_size').text("");
			$("#file_name").text("선택된 파일 없음");
			$("#close_file_btn").css("display", "none");
		}); */
	});
	
	// 파일 정보 처리
	function getFileInfo(fullName) {
	    var originalFileName;   // 화면에 출력할 파일명
	    var imgSrc;                   // 썸네일 or 파일아이콘 이미지 파일 출력 요청 URL
	    var originalFileUrl;       // 원본파일 요청 URL
	    var uuidFileName;       // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)
	    var basicFileName = fullName;      // 삭제시 값을 전달하기 위한 파일이름을 줄이지 않은 url
		
	    // 이미지 파일이면
	    if (checkImageType(fullName)) {
	        imgSrc = "${path}/upload/displayFile?fileName=" + fullName; // 썸네일 이미지 링크
	        uuidFileName = fullName.substr(14);
	        // 실제 uuid가 붙은 원본파일 이
	        var originalImg = fullName.substr(0, 12) + fullName.substr(14);
	        // 원본 이미지 요청 링크
	        originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
	    } else {
	        imgSrc = "${path}/resources/img/file-icon.png"; // 파일 아이콘 이미지 링크
	        uuidFileName = fullName.substr(12);
	        // 파일 다운로드 요청 링크
	        originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
	    }
	    originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
	 // 전체 파일명의 크기가 14보다 작으면 그대로 이름 출력,
	    // 14보다 크면 실행
	    if(originalFileName.length > 14) {
	    	// 앞에서부터 11글자 자름
	    	var shortName = originalFileName.substr(0, 10);
	    	// .을 기준으로 배열 생성
	    	var formatVal = originalFileName.split(".");
		// formatVal = originalFileName.substr(originalFileName.length-3);
		// 파일명에 .이 여러개 들어가 있을수도 있음
		// 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
		var arrNum = formatVal.length - 1
		// 맨 처음 문자열 10글자 + ... + 확장자
		originalFileName = shortName + "..." + formatVal[arrNum];
	    }
	    return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName};
	}
	//첨부파일 출력
	function printFiles(data) {
		// 썸네일 이름 data = /2019/07/12/s_dkdjfjlsdf라이언.jpg
	    // 파일 정보 처리
	    var fileInfo = getFileInfo(data);
	    /* console.log(fileInfo); */
	    // Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
	    var html = fileTemplate(fileInfo);
	    html += "<input type='hidden' class='file' value='"
			+fileInfo.fullName+"'>";
	    // Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
	    $(".uploadedList").append(html);
	    // 이미지 파일인 경우 aaaaaaaaaaa파일 템플릿에 lightbox 속성 추가
	    if (fileInfo.fullName.substr(12, 2) === "s_") {
	        // 마지막에 추가된 첨부파일 템플릿 선택자
	        var that = $(".uploadedList li").last();
	        // lightbox 속성 추가
	        that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
	        // 파일 아이콘에서 이미지 아이콘으로 변경
	        that.find(".fa-paperclip").attr("class", "fa fa-camera");
	    }
	}
	function getOriginalName(fileName){
		if(checkImageType(fileName)){ //이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
			return;
		}
		var front=fileName.substr(0,12);//연월일 경로
		var end=fileName.substr(14);// s_ 제거
		return front+end;
	}
	function checkImageType(fileName){
		var pattern=/jpg|gif|png|jpeg/i; //정규표현식(대소문자 무시)
		return fileName.match(pattern); //규칙에 맞으면 true
	}
	
	//첨부파일 리스트를 출력하는 함수
	function listAttach(){
		var listCnt = 0;
		$.ajax({
			type: "post",
			url: "${path}/board/getAttach/${one.bno}",
			async: false,
			success: function(list){
				// list : json
				//console.log(list);
				listCnt = list.length;
				
				/* console.log(list.length); */
				/* 
					jQuery each()는 반복문
					i와 e는 index와 element로
					json에서 { 0: "apple.png"}일 때
					index는 0, element는 apple.png가 됨
				*/
				$(list).each(function(i, e){
					/* console.log(list) */
					printFiles(e); // 첨부파일 출력 메서드 호출
				});
			}
		});
		return listCnt;
	}
	
	
</script>
</body>
</html>