<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style type="text/css">
	.body {
		width:auto;
		margin: auto auto;
		background-color: #333;
	}
	.body_content{
		border:1px solid #ddd;
	}
</style>
</head>
<body>
	<div class="body">
		<div class="body_content">
			<div class="body_title">
				회원탈퇴
			</div>
				 
			<div class="body_content">
				<p>님의 회원 탈퇴시 아래의 조치가 취해집니다.</p>
				<p>1. 개인정보는 <span>'개인정보 정책'따라 60일간 보관(잠김)되며</span>,
			</div>
			
			<div class="pw_ck">
				<input type="password" placeholder="비밀번호" >
			</div>
			
			<div class="btn_area">
				<span><a href="#" class="btn" id="cancel_btn">취소</a></span>
				<span><a href="#" class="btn" id="cancel_btn">탈퇴</a></span>
			</div>
		</div>
	</div>


<!--에러메시지에 스판에 바로 클래스로 pwAjax 설정해라  -->

<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var state = false;
		$('#inputpw').blur(function(){
			var nowId = "${sessionScope.loginUser.id}";
			var nowPw = $(this).val();
			
			state = ajaxPwCheck(nowId, nowPw);
			/* currentPw = ajaxPwCheck(); */
		});
		
		$('.btn_agree').click(function(){
			alert(state);
			if (state) {
				$('#modal_all').css('display', 'block');
			} else {
				$('#inputpw').focus();
			}
		});
		
		$('#yes_btn').click(function({
			/* var id = "${sessionScope.loginUser.id}";
			location.href="dropMember.freshcoffee?id=" + id; */
			
			location.href="dropMember.freshcoffee";
		});
	});
</script>
</body>
</html>