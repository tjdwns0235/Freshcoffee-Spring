<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp"%>
     <%@include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/common.css">
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Sunflower:300&display=swap');	
		* {
			box-sizing: border-box;
			font-family: 'Sunflower', sans-serif;
		}
		body {background: #f5f6f7;}
		ul {list-style: none;}
		a {text-decoration: none; color: inherit;}

		/*사이트 로고*/
		/*.fresh_logo {
			height: 147px;
			width: 327px;
		}*/
		.header, .container, .footer {
			width: 768px;
			margin: auto;
		}
		.header {
			padding-bottom: 20px;
			padding-top: 20px;
			position: relative; 
			height: 200px;
		}
		.container {
			margin: 0 auto;
			max-width: 768px;
			min-width: 460px;
		}
		.footer {
			height: 81px;
			text-align: center;
			padding: 30px 0 15px;
		}
		.f_logo {
			display: block;
			width: 327px;
			height: 147px;
			margin: auto auto;
		}

		/*회원가입 정보*/
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.row_group {
			overflow: hidden;
			width: 100%;
		}
		.join_title {
			margin: 19px 0 8px;
			padding-left: 5px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.ps_box {
			display: block;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px;
			background: #fff;
			vertical-align: top;
		}
		.int_id {
			padding-right: 110px;
		}
		.int {
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size:15px;
			z-index: 10;
		}
		.step_url {
			position: absolute;
			top:16px;
			right: 13px;
			font-size: 15px;
			line-height: 18px;
			color: #8e8e8e;
		}
		.error_next_box {
			display: none;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
		}
		.int_pass {
			padding-right: 40px;
		}
		.bir_wrap {
			display: table;
			width: 460px;
			align-items: center;
		}
		.bir_yy {
			padding-left: 0;
		}
		.bir_dd,.bir_mm, .bir_yy {
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.bir_mm+.bir_dd, .bir_yy+.bir_mm {
			padding-left: 10px;
		}
		.join_birthday .ps_box {
			padding: 11px 14px;
		}
		.sel {
			background: #fff url("${path}/resources/img/sel_arr.gif") 100% 50% no-repeat;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
		}
		/*가입하기 버튼*/
		.btn_double_area {
			margin: 30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			width: 100%;
		}
		.btn_type {
			width: auto;
			margin:0 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: block;
			height: 61px;
			padding-top: 1px;
			text-align: center;
			color: #fff;
			border: 1px solid #a5dff9;
			background-color: #a5dff9;
		}	
		.footer_wrap > ul {
			list-style: none;
			margin: 0 auto 9px;
		}
		.footer_wrap * {
			font-size: 11px;
			line-height: normal;
			color: #333;
		}
		.footer_wrap > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		.footer_wrap > ul > li a:hover {
			color: #a5dff9;
		}
		.footer_wrap > ul > li:first-child {
			border-left: 0;
		}
		#postcode {
			width: 106px;
			height: 31px;
			margin-bottom: 4px;
		}
		#search_btn {
			width:109px;
			height:31px;
			margin-bottom: 4px;
		}
		#address {
			width: 370px;
			height: 31px;
			margin-bottom: 4px;
		}
		#detailAddress {
			width: 240px;
			height: 31px;
			margin-bottom: 4px;

		}
		
		#extraAddress {
			width: 200px;
			height: 31px;
			margin-bottom: 4px;
		}
		#email_wrap {
			display: flex;
			margin-bottom: 15px;
			align-items: center;
		}
		#email_wrap > div {
			padding: 5px 10px;
		}
		#email_wrap > * {
			margin-right: 10px;
		}
		#selmail {
			height: 100%;
			width: 105px;
		}
		#email, #selmail, #email_url{
			height: 31px; 
		}
		



		
	</style>
</head>
<body>

	
	<header>
		<div class="header">
			<h1 class="fresh_logo">
				<a href="#" class="f_logo"></a>
			</h1>
		</div>
	</header>

	<section>
		<form class="join_form" method="POST" action="${path}/member/create" name="frm_mem" id="frm_mem">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="id" name="id" class="int" maxlength="20">
							</span>
							<span class="error_next_box">
								필수정보입니다.
							</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="pwd1">비밀번호</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" name="pwd1" class="int" id="pw" maxlength="20">
								<span class="step_url"><i class="fas fa-unlock-alt"></i></span>
							</span>	
							<span class="error_next_box">
								필수정보입니다.
							</span>	

								<h3 class="join_title">
									<label for="pwd2">
										비밀번호 재확인
									</label>
								</h3>
								<span class="ps_box int_pass">
									<input type="password" name="pwd2" id="pwd2" class="int" maxlength="20">
									<span class="step_url"><i class="fas fa-unlock"></i></span>
								</span>
								<span class="error_next_box">
									필수정보입니다.
								</span>	
						</div>
						
					</div>
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box">
								<input type="text" name="name"
								id="name" class="int" maxlength="20">
							</span>
							<span class="error_next_box">
								필수정보입니다.
							</span>
						</div>

						<div class="join_row join_birthday">
							<h3 class="join_title">
								<label for="yy">생년월일</label>
							</h3>
							<span class="error_next_box">
									생입니다.
							</span>
						</div>

						<div class="bir_wrap">
							<div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy"
									placeholder="년(4자)" name="bir1" class="int" maxlength="4">
								</span>
							</div>

							<div class="bir_mm">
								<span class="ps_box">
									<select id="mm" class="sel" name="bir2" >
										<option>월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</span>
							</div>
							<div class="bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" placeholder="일" class="int" maxlength="4" name="bir3"  >
								</span>
								
							</div>
						</div>
						
						
						<div class="join_row join_phone">
							<h3 class="join_title">
								<label for="phone">휴대전화</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="phone"
								class="int" name="phone" maxlength="11">
							</span>
							<span class="error_next_box">
								휴대전입니다.
							</span>
						</div>
						
						<div class="join_row"><h3 class="join_title"><label for="email">이메일</label></h3>
							<span class="error_next_box">
									이메입니다.
							</span>
						</div>

						<div id="email_wrap">
							<input type="text" id="email_id" placeholder="email 주소." class="info_input email" name="email_id">
							<span> @ </span>
							<input type="text" id="email_url" class="info_input email_url" name="email_url" placeholder="이메일선택">
							<div class="join_div sel_url">
								<select id="selmail" class="info_input">
									<option value="directVal" selected="selected">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음카카오</option>
									<option value="gmail.com">구글</option>
									<option value="nate.com">네이트</option>
								</select>
								<input type="hidden" id="email" name="email">
								<span class="error"></span>
							</div>
						</div>


						

						
						    <div class="join_row join_phone">
							<h3 class="join_title">
								<label for="postcode">주소</label>
							</h3>
							<span class="error_next_box">
								주입니다.
							</span>
						</div>



		<input type="text" id="sample6_postcode postcode" class="addrbtn" readonly="readonly" placeholder="우편번호">
		<input type="button" id="addr_btn" name="zipcode" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address address" name="addr1" class="addrbtn" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress detailAddress" name="addr2" placeholder="상세주소">
		</form>
		

		<div class="btn_double_area">
			<span>
				<a href="#" class="btn_type">
					가입하기
				</a>
			</span>
		</div>
	</section>
	

	<footer>
		<div class="footer">
			<div class="footer_wrap">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>

				<div class="address">
					<span>Copyright</span>
					<span>ⓒ</span>
					<span>All Rights Reserved.</span>
				</div>
			</div>
		</div>
	</footer>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		var 
		form = $('#join_frm'),
		uid = $('#id'),
		upw = $('#pw'),
		urepw = $('#pwd2'),
		uname = $('#name'),
		uphone = $('#phone'),
		umail = $('#email_id'),
		uurl = $('#email_url');
	
		// id
		// 1) null
		// 2) 공백체크
		// 3) 정규식
		// 4) 중복체크
		
		// 1. input(#id)에 값을 입력 후 blur()하면 이벤트 발생
		$(uid).blur(function(){
			// 2. input(#id) value값을 가져와 memId에 담음
			var memId = $.trim($('#id').val());
			// 3. joinValidate의 checkId() 함수를 실행, memId를 매개변수로 보냄
			// 7. checkId() 함수를 실행 후 결과값 success_id(code, desc)를 변수 checkResult에 담음
			var checkResult = joinValidate.checkId(memId);
			// 8-1(실패). code 값이 0이 아닌 경우 → 유효한 값 아님         
			if(checkResult.code != 0) {
				// 경고 메시지 출력
				$('.error_next_box').eq(0).text(checkResult.desc)
								   .css('display', 'block')
								   .css('color', 'tomato');
				return false;
			// 8-2(성공). code 값이 0인 경우 → 유효한 값
			} else {
				// 중복여부 체크를 위한 Ajax 검증 시작
				// 9. ajaxCheck() 메서드 실행, memId를 매개변수로 보냄
				// 31. ajaxCheck(memId)의 return 값이 1이면 return true;
				if(ajaxCheck(memId) == true){
					return true;
				}
			}
			// 32. ajaxCheck(memId)의 return 값이 -1이면 이곳에서 막히도록 하기 위해 return false;
			return false;
		});
		
		// pw
		// 1) null	
		// 2) 공백체크
		// 3) 정규식
		
		$('#pw').blur(function(){
			var memPw = $.trim($('#pw').val());
			var memRpw = $.trim($('#pwd2').val());
			var checkResult = joinValidate.checkPw(memPw, memRpw);
			
			if(checkResult.code != 0) {
				$('.error_next_box').eq(1).text(checkResult.desc)
								   .css('display', 'block')
								   .css('color', 'tomato');
				return false;
			} else {
				$('.error_next_box').eq(1).text(checkResult.desc)
								   .css('display', 'block')
								   .css('color', 'dodgerblue');
				if(memRpw != "" || memRpw.length != 0) {	
					if(memPw == memRpw) {
						$('.error_next_box').eq(2).text("비밀번호가 일치합니다.")
						  				   .css('display', 'block')
						  				   .css('color', 'dodgerblue');
					} else {
						$('.error_next_box').eq(2).text("입력하신 비밀번호가 일치하지 않습니다.")
						  				   .css('display', 'block')
						  				   .css('color', 'tomato');
						return false;
					}
				}
				return true;
			}
			return false;
		});
		
		// repw
		// 1) null
		// 2) 공백체크
		// 3) 정규식
		// 4) pw != repw

		$('#pwd2').blur(function(){
			var memPw = $.trim($('#pw').val());
			var memRpw = $.trim($('#pwd2').val());
			var checkResult = joinValidate.checkRpw(memPw, memRpw);
			
			if(checkResult.code != 0) {
				$('.error_next_box').eq(2).text(checkResult.desc)
								   .css('display', 'block')
								   .css('color', 'tomato');
				return false;
			} else {
				$('.error_next_box').eq(2).text(checkResult.desc)
								   .css('display', 'block')
								   .css('color', 'dodgerblue');
				if(memPw != "" || memPw.length != 0) {	
					if(memPw == memRpw) {
						$('.error_next_box').eq(2).text("비밀번호가 일치합니다.")
						  				   .css('display', 'block')  
						  				   .css('color', 'dodgerblue');
					} else {
						$('.error_next_box').eq(2).text("입력하신 비밀번호가 일치하지 않습니다.")
						  				   .css('display', 'block') 
						  				   .css('color', 'tomato');
						return false;
					}
				}
				return true;
			}
			return false;
		});
		
		// name
		// 1) null
		// 2) 공백체크
		// 3) 정규식
		
		$('#name').blur(function(){
			var name = $.trim($(this).val());
			var regKor = /[^가-힣]/;
			var regEmpty = /\s/g;
			
			if(name == "" || name.length == 0) {
				$('.error_next_box').eq(3).text('필수 입력 정보입니다.')
				   				   .css('display', 'block')
				  				   .css('color', 'tomato');
				return false;
			} else if(name.match(regEmpty)) {
				$('.error_next_box').eq(3).text('공백 없이 입력해주세요.')
				                   .css('display', 'block')
				                   .css('color', 'tomato');
		 		return false;
			} else if(regKor.test(name)) {
				$('.error_next_box').eq(3).text('이름은 표준 한글만 입력 가능합니다.')
								   .css('display', 'block')
								   .css('color', 'tomato');
				return false;
			} else if(name.length < 2 || name.length > 4) { 
				$('.error_next_box').eq(3).text('이름은 2자 이상 4자 이하여만 합니다.')
								   .css('display', 'block')
								   .css('color', 'tomato');
				return false;  
			} else {
				$('.error_next_box').eq(3).text('멋진 이름이네요!')
								   .css('display', 'block')
								   .css('color', 'dodgerblue');
			}
		});
		
		// phone
		// 1) null
		// 2) 공백체크
		// 3) 정규식
		
		$('#phone').blur(function(){
			var phone = $.trim($(this).val());
			var regEmpty = /\s/g;
			var regPhone = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;
			if(phone == "" || phone.length == 0) {
				$('.error_next_box').eq(5).text('필수 입력 정보입니다.')
				   				   .css('display', 'block')
				  				   .css('color', 'tomato');
				return false;
			} else if(phone.match(regEmpty)) {
				$('.error_next_box').eq(5).text('공백 없이 입력해주세요.')
				                   .css('display', 'block')
				                   .css('color', 'tomato');
		 		return false;
			} else if($.isNumeric(phone) == false) {
				$('.error_next_box').eq(5).text('숫자만 입력해주세요.')
				                   .css('display', 'block')
				                   .css('color', 'tomato');
				return false;
			} else if(phone.indexOf("01") != 0) {
				$('.error_next_box').eq(5).text('휴대폰 번호가 유효하지 않습니다.')
				                   .css('display', 'block')
				                   .css('color', 'tomato');
				return false;
			} else if(!(phone.length == 10 || phone.length == 11)) {
				$('.error_next_box').eq(5).text("'-' 없이 10, 11자로 입력해주세요.")
				                   .css('display', 'block')
				                   .css('color', 'tomato');
				return false;
			} else {
				$('.error_next_box').eq(5).text('멋진 전화번호네요!')
								   .css('display', 'block')
								   .css('color', 'dodgerblue');
			}		
		});
		
		$('#email_id').blur(function(){
			var email = $.trim($(this).val());
			var url = $.trim($('#email_url').val());
			var regEmpty = /\s/g;
			var emailReg = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
			
			if(email == "" || email.length == 0) {
				$('.error_next_box').eq(6).text('필수 입력 정보입니다.')
				   				   .css('display', 'block')
				  				   .css('color', 'tomato');
				return false;
			} else if(email.match(regEmpty)) {
				$('.error_next_box').eq(6).text('공백 없이 입력해주세요.')
				                   .css('display', 'block')
				                   .css('color', 'tomato');
		 		return false;
			} else if(url != "" || url.length != 0) {
				var fullMail = email + "@" + url;
				if(!emailReg.test(fullMail)) {
					$('.error_next_box').eq(6).text('올바른 이메일을 입력해주세요.')
									   .css('display', 'block')
									   .css('color', 'tomato');
					return false;
				} else {
					$('.error_next_box').eq(6).text('멋진 이메일이네요!')
									   .css('display', 'block')
									   .css('color', 'dodgerblue');
				}
			} else {
				$('.error_next_box').eq(6).text('')
				return false;
			}
		});
		
		$('#email_url').blur(function(){
			var email = $.trim($('#email_id').val());
			var url = $.trim($(this).val());
			var regEmpty = /\s/g;
			var emailReg = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
			
			if(url == "" || url.length == 0) {
				$('.error_next_box').eq(7).text('필수 입력 정보입니다.')
				   				   .css('display', 'block')
				  				   .css('color', 'tomato');
				return false;
			} else if(url.match(regEmpty)) {
				$('.error_next_box').eq(6).text('공백 없이 입력해주세요.')
				                   .css('display', 'block')
				                   .css('color', 'tomato');
		 		return false;
			} else if(email != "" || email.length != 0) {
				var fullMail = email + "@" + url;
				if(!emailReg.test(fullMail)) {
					$('.error_next_box').eq(6).text('올바른 이메일을 입력해주세요.')
									   .css('display', 'block')
									   .css('color', 'tomato');
					return false;
				} else {
					$('.error_next_box').eq(6).text('멋진 이메일이네요!')
									   .css('display', 'block')
									   .css('color', 'dodgerblue');
				}
			} else {
				$('.error_next_box').eq(6).text('')
				return false;
			}
		});
		

		$('#selmail').change(function() { 
			var selmail = $(this).val();
			alert(selmail);

			if(selmail == 'directVal') {
				$('#email_url').val("");
				$('#email_url').focus();
				$('#email_url').removeAttr('readonly');
			} else {
				$('#email_url').val(selmail);
				$('#email_url').prop('readonly', true);
				$('#email_url').blur();
			}
		});
		
		// 우편번호, 주소 클릭시 다음주소API 창 출력
		$('.addrbtn').click(function(){
			var zipcode = $('.addrbtn').eq(0).val();
			var addr = $('.addrbtn').eq(1).val();
			
			if(zipcode == "" || addr == "") {
				$('#addr_btn').click();
			}
			
			alert(zipcode + ", " + addr)
		});
		
		$('#sample6_detailAddress').blur(function(){
			var dAddr = $.trim($(this).val());
			
			if(dAddr == "" || dAddr.length == 0) {
				$('error_next_box').eq(7).text('필수 입력 정보입니다.')
				   				   .css('display', 'block')
				  				   .css('color', 'tomato');
				return false;
			} 
		});
		
		$('.btn_type').click(function(){
			$('#frm_mem').submit();
			
		});
		
	});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = '';
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>

</body>
</html>