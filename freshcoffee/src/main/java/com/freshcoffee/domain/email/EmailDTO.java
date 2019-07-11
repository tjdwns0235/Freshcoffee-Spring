package com.freshcoffee.domain.email;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor  // 전체 생성자
@Getter // getter()
@Setter // setter()
@ToString // toString()
public class EmailDTO {
	private String senderName;  // 	발신자이름 
	private String senderMail;	//	발신자 이메일 주소
	private String receiveMail;	//	수신자 이메일 주	
	private String subject;		//	제목
	private String message;		//	본문
}
