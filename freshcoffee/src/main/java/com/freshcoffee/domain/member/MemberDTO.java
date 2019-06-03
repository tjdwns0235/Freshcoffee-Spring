package com.freshcoffee.domain.member;

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
public class MemberDTO {
	private String id; 
    private String pw;	 
    private String name; 
    private String phone; 
    private String email; 
    private String email_url;
    private String zipcode;
    private String addr1;
    private String addr2;
    private String bir1;
    private String bir2;
    private String bir3;
    private Date regdate;
}
