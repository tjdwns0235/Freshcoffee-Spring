<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" href="${path}/resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
	<div id="modal">
		<div id="modal_login">
			<header>
				<a href="#" id="title_img">
					<img src="${path}/resources/img/freshcoffee2.png" alt="커피 로고">
				</a>
			</header>
			
		<section style="margin-top:15px;">
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
		<button id="modal_close"><i class="fas fa-times"></i></button>
			</div>
		</div>
			
			
			
			
			
		
		
		
	
	<header>
		<button id="topBtn">
			<i class="fas fa-arrow-up"></i>
		</button>
		
		<div class="header_menu"> 
			<div class="inner_header">
				<div class="header_sns">
					<a href="#"><i class="fab fa-instagram"></i></a>
					<a href="#"><i class="fab fa-facebook-f"></i></a>
					<a href="#"><i class="fab fa-twitter"></i></a>
					<a href="#"><i class="fab fa-google"></i></a>
				</div>
				
				
				<div class="header_member">
					<ul>
						<c:choose>
					 		<c:when test="${empty sessionScope.name}">
								<li><a href="#" id="modal_open">로그인</a></li>
								<li><a href="${path}/member/constract">회원가입</a></li>
								<li><a href="#" class="mypage">마이페이지</a>
								<li><a href="#" >장바구니</a></li>
							 </c:when>
							 
						  	 <c:otherwise>
							  	<li><a href="#" class="mypage logout_btn">로그아웃</a>
								<li><a href="#" class="mypage" id="mypage">마이페이지</a>
									<div class="dropdown">
									     <a href="${path}/member/pwupdate">비밀번호 수정</a>
										 <a href="${path}/member/update">회원수정</a>
										 <a href="${path}/member/delete">회원탈퇴</a>
									</div>
								 </li>
								 
								<li><a href="#" >장바구니</a></li>
							</c:otherwise>
						</c:choose>
		   	    	</ul>
				</div>
			</div>
		</div>
		
		<div class="header_logo">
			<div class="inner_header">
				<a href="${path}/"><img src="${path}/resources/img/freshcoffee2.png" alt="로고이미지"></a>
			</div>
		</div>
    </header>
    
    <nav>
		<div class="header_nav">
			<div class="inner_header2">
				<ul>
					<li><a href="#" class="li1">북아메리카</a>
						<div class="dropdown1">
							<a href="#" >멕시코</a>
							<a href="#">하와이</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">남아메리카</a>
						<div class="dropdown1">
							<a href="#">과테말라</a>
							<a href="#">도미니카</a>
							<a href="#">볼리비아</a>
							<a href="#">브라질</a>
							<a href="#">엘살바도르</a>
							<a href="#">자메이카</a>
							<a href="#">코스타리카</a>
							<a href="#">콜롬비아</a>
							<a href="#">파나마</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">아시아</a>
					<div class="dropdown1">
							<a href="#">베트남</a>
							<a href="#">인도네시아</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">아프리카</a>
						<div class="dropdown1">
							<a href="#">에티오피아</a>
							<a href="#">케냐</a>
							<a href="#">탄자니아</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">오세아니아</a>
						<div class="dropdown1">
							<a href="#">파푸아뉴기니</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">Q & A</a>
						<div class="dropdown1">
							<a href="${path}/board/list">Q & A</a>
							<a href="#">문의하기</a>
						</div>
					</li>

				</ul>
			</div>
		</div>
	</nav>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	// 로그인 인터셉터에서 보내는 메시지
	var message = '${message}';
	var uri = '${uri}';
	
		$(document).ready(function() {
			if (message == 'nologin') {
				$('#modal').css('display', 'flex');
				$('.err_code').eq(1).text('로그인이 필요한 시스템입니다').css('display','block');
			}
			
			
			$(window).scroll(function(){
				var scrolValue = $(this).scrollTop();
				if (scrolValue > 40) {
					$('#topBtn').fadeIn();
				} else {
					$('#topBtn').fadeOut();
				}
			});
			
			$("#btn_login").click(function(){
				
				var id = $.trim($('#inputid').val());
				var pw = $.trim($('#inputpw').val());
				
				var regEmpty = /\s/g;
				
				// 1. null 체크
				// 2. 공백 체크
				
				if(id == null || id.length == 0) {
					$('.err_code').eq(0).text('필수 정보입니다.')
								 .css('display', 'block');
					return false;
				} else if(id.match(regEmpty)) {
					$('.err_code').eq(0).text('공백 없이 입력해주세요.')
					 			 .css('display', 'block');
					return false;
				}
				
				if(pw == null || pw.length == 0) {
					$('.err_code').eq(1).text('필수 정보입니다.')
								 .css('display', 'block');
					return false;
				} else if(pw.match(regEmpty)) {
					$('.err_code').eq(1).text('공백 없이 입력해주세요.')
					 			 .css('display', 'block');
					return false;
				}
				
				$.ajax({
					url: "${path}/member/login",
					type: "POST",
					dataType: "text",
					data: "id="+id+"&pw="+pw,
					success: function(data) {
						if(data == "1") {
							if (uri == "") {
								location.reload();
							}else  {
								location.href = uri;
							}
						} else if(data == "-1") {
							$('#inputid').select();
							$('.err_code').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.')
							              .css('display', 'block');
						}
					},
					error:function() {
						alert("System Error♨");
					}
				});
			});
			
			$(document).on('click', '.logout_btn', function(){
				$.ajax({
					url: "${path}/member/logout",
					type: "POST",
					success: function(data) {
						location.reload();
					},
					error:function() {
						alert("System Error♨");
					}
				});
			});
			
			
			
			
			$('#topBtn').click(function(event) {
				$('html, body').animate({scrollTop : 0}, 500);
			});
			
			$('#modal_open').click(function(){
				$('#modal').css('display', 'flex');
				$('#inputid').focus();
			});
			$('#modal_close').click(function(){
				$('.input_login').val("");
				$('.err_code').css('display', 'none');
				$('#modal').css('display', 'none');
			});
			
			/* $(document).on('click', 'logout_btn', function(){
				$.ajax({
					url: "logoutAjax",
					type: "POST",
					dataType: "json",
					success: function(data) {
						location.reload();
					},
					error: function() {
						alert("System Error");
					}
				});
			}); */
		});
	</script>
</body>
</html>