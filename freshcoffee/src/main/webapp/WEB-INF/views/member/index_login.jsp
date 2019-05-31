<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
		body, ul {
			margin: 0;
			padding: 0;
			background-color: #f5f6f7;
			font-family: 'Nanum Gothic', sans-serif;
		}
		ul {list-style: none;}
		a {text-decoration: none;}

		a:link, a:visited {
			color: inherit;
		}
		#modal {
			width: 430px;
			margin: auto;
		}
		#modal_login {
			width: 100%;
			margin: 62px auto;
			text-align: center;
		}
		#title_img a  {
			text-align: center;
		}
		#title_img > img {
			width: 80%;
			text-align: center;
		}
		.div_input {
			background-color: white;
			border: 1px solid #dadada;
			padding: 10px 35px 10px 15px;
			margin-bottom: 14px;
			width: 370px;
			height: 29px;
		}
		.input_box {
			overflow: hidden;
		}
		.input_login {
			width: 360px;
			padding: 7px 0px 6px 0px;
			cursor: pointer;
			border-radius: 0;
			border: none;
		}
		#btn_login {
			display: block;
			background-color: #fe4365;
			color: white;
			font-size: 22px;
			padding-top: 2px;
			margin: 30px 0px 13px;
			width: 423px;
			height: 59px;
			text-decoration: none;
			text-align: center;
			line-height: 61px;
		}
		table {
			width: 100%;
		}
		#member {
			text-align: center;
			padding: -2px 17px 0 0;
			font-size: 13px;

		}
		
		#state {
			font-size: 13px;
			position: relative;
		}
		#state > a {
			font-size: 12px;
		}
		td {
			height: 26px;
		}
		#state > label {
			background: url("${path}../img/loginlff.PNG") no-repeat;
			display: block;
			height: 15px;
			line-height: 12px;
			padding-left: 15px;
		}
		#state > input{
			visibility: hidden;
			position: absolute;
			right: 1px;
			width: 22px;
			height: 22px;
			margin-top: -11px;
		}
		#state > input:checked +label {
			background-image: url("${path}../img/loginon.PNG");
		}
		#state img {
			vertical-align: middle;
		}

		.si {
			color: #d5d5d5;
		}
		hr {
			width: 98%;
			margin:20px auto;
			border: thin solid #eaeaea;
			padding: 0px auto;
		}
		
		.err_code {
			display: none;
			color: #ff1616;
			font-size: 12px;
		}
	</style>
</head>
	<script type="text/javascript">
		$(document).ready(function() {
			

				$('.input_login').focus(function() {
						$(this).parent().parent().css('border', '1.5px solid #a5dff9');
					});

					$('#inputid').focus();

					$('.input_login').blur(function() {
						$(this).parent().parent().css('border', '1px solid #dadada');
					});

						var valId = $('#inputid').val();
						var valPw = $('#inputpw').val();

						$('#btn_login').click(function() {
						if(valId == '') {
							$('.err_code').first().css('display','block');
							$('#inputid').focus();
						}
						else if (valPw == '') {
							$('.err_code').last().css('display', 'block');
							$('#inputpw').focus();
						}
						if (valId != '') {
							$('.err_code').first().css('display','none');
						}
						if (valPw != '') {
							$('.err_code').last().css('display','none');
						}
					});
		});
	</script>
</head>
<body>
	<div id="modal">
		<div id="modal_login">
			<header>
				<a href="#" id="title_img">
					<img src="../img/freshcoffee2.png" alt="커피 로고">
				</a>
			</header>
			
		<section>
			<div class="div_input" id="naver_id">
				<span class="input_box">
					<input type="text" placeholder="아이디" class="input_login" id="inputid">
				</span>
			</div>
			
				<span class="err_code">아이디를 입력해주세요.</span>
			<div class="div_input" id="naver_pw">
				<span class="input_box">
					<input type="password" placeholder="비밀번호" class="input_login" id="inputpw" name="">
				</span>
			</div>
			
			<span class="err_code">비밀번호를 입력해주세요.</span>
				<a href="#" id="btn_login">로그인</a>
				
				<table>
					<tr> 
						<td id="state">
							<input type="checkbox" id="loginck" name="">
							<label for="loginck" class="label">&nbsp;로그인 상태 유지</label>
						</td>
						
						<td id="member">
							<span id="members">&nbsp;
								<a href="#">아이디 찾기</a>&nbsp;<span class="si">|</span>&nbsp;
							    <a href="#">비밀번호 찾기</a>&nbsp;<span class="si">|</span>&nbsp;
								<a href="#">회원가입</a>
							</span>
						</td>
						
					</tr>
				</table>
		</section>
		<button id="mdal_close"><i class="fas fa-times"></i></button>
			</div>
		</div>
			
			<footer>
				<%@ include file="../include/footer.jsp" %>
			</footer>
			
			
			
		</div>
</body>
</html>