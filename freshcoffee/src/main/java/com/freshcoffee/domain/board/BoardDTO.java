package com.freshcoffee.domain.board;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	private int replycnt;
	private int goodcnt;
	private String id; //작성자 이름(tbl_member 테이블과 조인)
	private Date regdate;
	private String filename;
	private int filesize;
}
