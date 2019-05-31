<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Freshcoffee 회원가입</title>
<style type="text/css">
		body, h1, ul, p, h3 {
			margin:0;
			padding: 0;
		}
		body {background: #f5f6f7;}
		.freshcoffee_logo {font-size: 2em;}
		.header, .container, .footer {
			width: 768px;
			margin: auto;
			box-sizing: border-box;
		}
		.header {
			height: 169px;
			padding-top: 10px;
			position: relative;
			/*border: 1px solid slateblue;*/
		}
		.container {
			position: relative;
			/*border: 1px solid dodgerblue;*/
		}
		.footer {
			height: 81px;
			text-align: center;
			padding: 30px 0px 15px;
			/*border: 1px solid mediumseagreen;*/
		}
		.f_logo {
			display: block;
			width: 330px;
			height: 150px;
			background: url("img/freshcoffee2.png");
			margin: auto;
			box-sizing: border-box;
		}
		.lang {
			position: absolute;
			top: 14px;
			right: 0px;
		}
		.langselect {
			font-size: 12px;
			font-weight: 400;
			height: 30px;
			padding: 6px 8px 5px 7px;
			min-width: 98px;
			color: #333;
			border: 1px solid #ccc;
		}
		.lang>select {
			background: url('images/sel_arr.gif')100% 50% no-repeat;
			-webkit-appearance:none;
			width: 98px;
			height: 30px;
			background-color: white;
		}

		.join_content {
			width: 460px;
			margin: 0 auto;
		}

		.terms {
			margin-bottom: 20px;
			background-color: white;
			border: 1px solid #dadada; 
		}
		.terms_span > input {
			position: absolute;
			right: 1px;
			top: 50%;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.terms_p {
			display: block;
			padding: 15px;
			margin: 0px;
			position: relative; 
		}
		.terms_span > label {
			background: url('images/loginlff.PNG')100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 58px;
			top: -1px;
			font-size: 14px;
			font-weight: 700;
		}
		.terms_span {
			position: relative;
			display: block;
			height: 58px;
		}
		.terms_span > input:checked +label {
			background-image: url('images/loginon.PNG');
		}
		.terms_ul {
			padding-bottom: 7px;
			list-style: none;
		}
		.terms_ul_li1 {
			border-top: 1px solid #f0f0f0;
		}
		.terms_ul > li {
			display: block;
			padding: 13px 15px 7px;
		}
		.ul_li_span {
			position: relative;
			display: block;
			height: 24px;
		}
		.label1 {
			height: 24px;
			font-size: 14px;
			font-weight: 700;
			line-height: 24px;
			position: absolute;
			color: #333;
			top: 0;
			left: 0;
			width: 100%;
		}
		.span_only {
			color: #a5dff9;
			font-size: 12px;
			font-weight: 400;
		}
		.ul_li_span > input {
			visibility: hidden;
			position: absolute;
			right: 1px;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			top: 50%;
		}
		.ul_li_span > label {
			background: url('images/loginlff.PNG') 100% 50% no-repeat;
			display: block;
		}
		.ul_li_span > input:checked +label {
			background-image: url('images/loginon.PNG');
		}

		.terms_box {
			position: relative;
			box-sizing: border-box;
			height: 88px;
			margin-top: 11px;
			padding: 8px 10px;
			border: 1px solid #f0f0f0;
			background-color: #f7f7f7;
			overflow: auto;
		}
		.article_title {
			font-size: 12px;
			font-weight: 700;
			line-height: 16px;
			color: #666;
		}
		.article > P {
			font-size: 12px;
			line-height: 16px;
			color: #666;
		}
		.span_select {
			color: #969696;
			font-size: 12px;
			font-weight: 400;
		}
		.btn_double_area {
			margin:30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			float: left;
			width: 50%;
		}
		.btn_default {
			color: #333;
			border: 1px solid #a5dff9;
			background-color: #a5dff9;
		}
		.btn_agree {
			color: #333	;
			border: 1px solid #FADAD8;
			background-color: #FADAD8;
		}
		.btn_type {
			width: auto;
			margin:0 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: block;
			box-sizing: border-box;
			height: 61px;
			padding-top: 1px;
			text-align: center;
		}
		a {
			text-decoration: none;
			color: inherit;
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
		.footer_wrap ul li:first-child {
			border-left: 0px;
		}
		.addr_logo {
			width: 80px;
			height: 15px;
		}
		.address {
			margin: 0px auto;
			text-align: center;
		}
		.address * {
			font: 9px verdana;
		}
		.address a {
			font-weight: bold;
		}
		.address a:hover {
			color: #a5dff9;
		}
		#err_msg {
			color: tomato;
			display:none;
			text-align:center;
			font-size:12px;
		}
	</style>
</head>
<body>
	<header>
		<div class="header">
			<h1 class="freshcoffee_logo"><a href="#" class="f_logo"></a>
			</h1>
			<!-- <div class="lang">
				<select class="langselect">
					<option>한국어</option>
					<option>English</option>
					<option>中文(简体)</option>
					<option>中文(台灣)</option>
				</select>
			</div> -->
		</div>
	</header>

	<section>
		<div class="container">
			<form class="join_content">
				<div class="terms">
					<p class="terms_p">
						<span class="terms_span">
							<input type="checkbox" id="cbox">
							<label for="cbox">
								이용약관, 개인정보 수집 및 이용, <br>
								위치정보 이용약관(선택), 프로모션 안내<br>
								메일 수신(선택)에 모두 동의합니다. 
							</label>
						</span>
					</p>


					<ul class="terms_ul">
						<li class="terms_ul_li1">
							<span class="ul_li_span">
								<input type="checkbox" id="li1box" class="ckboxs">
								<label for="li1box" class="label1">FRESHCOFFEE 쇼핑몰 이용약관 동의<span class="span_only">(필수)</span></label>
							</span>
							<div class="terms_box">
								<div class="article">
									<h3 class="article_title">제 1조 (목적)</h3>
									<p>이 약관은 FRESHCOFFEE 주식회사가 제공하는 <br>  관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, <br> 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다 </p><br>

									<h3 class="article_title">제 2 조 (정의)</h3>
									<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
										①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유<br> 무선 장치를 포함)와 상관없이 "회원이 이용할 수 있는 FRESHCOFFEE 및 FRESHCOFFEE 관련 제반 서비스를 의미합니다</p>
								</div>
							</div>
						</li>


						<li class="terms_ul_li2">
							<span class="ul_li_span">
								<input type="checkbox" id="li2box" class="ckboxs">
								<label for="li2box" class="label1">FRESHCOFFEE 이용약관 동의<span class="span_only">(필수)</span></label>
							</span>
							<div class="terms_box">
								<div class="article">
									<p>정보통신망법 규정에 따라 FRESHCOFFEE에 회원가입 신청하시는 분께 수집하<br>는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및<br> 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>

									<h3 class="article_title">1. 수집하는 개인정보</h3>
									<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의<br>서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘<br>린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위<br>해 회원가입을 할 경우, 서비스 이용을 위해 필요한 최소한의<br> 개인정보를 수집합니다.</p>
								</div>
							</div>
						</li>


						<li class="terms_ul_li3">
							<span class="ul_li_span">
								<input type="checkbox" id="li3box" class="ckboxs">
								<label for="li3box" class="label1">위치정보 이용약관 동의<span class="span_select">(선택
						)</span></label>
							</span>
							<div class="terms_box">
								<div class="article">
									<p>위치정보 이용약관에 동의하시면,<strong> 위치를 활용한 광고 정보 수신</strong> 등을<br>
									포함하는 위치기반 서비스를 이용할 수 있습니다.</p></br>

									<h3 class="article_title">제 1 조 (목적)</h3>
									<p>이 약관은 주식회사가 제공하는 위치정보사업 또는<br> 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의<br>무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

									</p>
								</div>
							</div>
						</li>


						<li class="terms_ul_li4">
							<span class="ul_li_span">
								<input type="checkbox" id="li4box" class="ckboxs">
								<label for="li4box" class="label1">이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span></label>
							</span>
						</li>
				</div>
				<div class="btn_double_area">
					<span><a href="#" class="btn_type btn_default">비동의</a></span>
					<span><a href="#" class="btn_type btn_agree">동의</a></span>
				</div>
			</form>
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
					<span>
						<a href="#">
							<!-- <img src="images/freshcoffee.png" class="addr_logo" alt="freshcoffee 로고"> -->
						</a>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<span>All Rights Reserved.</span>
				</div>
			</div>
		</div>
	</footer>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	/*  $(document.)ready(function(){
		$("#cbox").click(function(){
			var ckAll = $("#cbox").is(":checked");
			if (ckALL == true) {
				$("#cbox").prop("checked", true);
			} else {
				$("#cbox").prop("checked", false);
			}
			if(filsu1 == true && filsu2 == true) {
				location.href = "member.freshcoffee";
			}else {
				$("#err_msg").css("display" "block" "tomato");
			}
		});
	});  */
	</script>

</body>
</html>