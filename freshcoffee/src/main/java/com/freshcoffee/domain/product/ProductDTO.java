package com.freshcoffee.domain.product;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductDTO {
	private String p_code;
	private String p_name;
	private int p_price;
	private String p_type;
	private String p_img;
	private int p_cnt;
	private int p_good;
	private Date p_indate;
	// 생성자
	// 전체생성자
	// 게터&세터
	// 투 스트링
	
	// lombok
}


