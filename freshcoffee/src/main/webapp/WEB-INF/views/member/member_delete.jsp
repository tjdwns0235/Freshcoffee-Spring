<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<header>

</header>
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
			alert(state);http
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