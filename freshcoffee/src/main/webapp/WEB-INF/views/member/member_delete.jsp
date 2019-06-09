<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="${path}/resources/css/common.css">
<style type="text/css">
	.body {
		margin: 0px 1000px;
		background-color: white;
		text-align: center;
	}
	.logo {
		margin: 100px;
	}
	.body_content{
		width:600px;
		height: 200px;
		border:1px solid #dadada;
	 	box-sizing: border-box; 
		margin: 0px 0px;
		text-align: center;
	}
	.pw_ck input {
		margin:40px 0;
		width:200px;
		height: 30px;
	}
	.btn {
		text-decoration: none;
		width: 420px;
		height: 30px;
	}
	#cancel_btn {
		width:210px;
		margin-right: 20px;
		background-color: #FFCBCB;
		color:white;
	}
	#ok_btn{
		width:210px;
		background-color: a5dff9;
		color:white;
	}
		.no_btn {
		text-decoration: none;
		color: dodgerblue;
		border-radius: 5px;
		border: 1px solid #5A5A5A;
		width: 60px;
		margin: 0px 25px;
		display: inline-block;
		font-size: 18px;
		font-weight: 500;
		height: 20px;
		text-align: center;
	}
	.yes_btn {
		text-decoration: none;
		color: tomato;
		border-radius: 5px;
		border: 1px solid #5A5A5A;
		width: 60px;
		margin: 0px 25px;
		display: inline-block;
		font-size: 18px;
		font-weight: 500;
		height: 20px;
		text-align: center;
	}
	.modal_content a:hover {
		background-color: #FFCBCB;
		border: 2px solid #FFCBCB;
		color: white;
	}
	#modal {
		position: fixed;
		z-index: 3;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.6);
		display: flex;
		justify-content: center;
		align-items: center;
	 	display: none; 
	}
	.modal_title {
		background-color: a5dff9;
		color: white;
		border-radius: 15px 15px 0px 0px;
		font-size: 20px;
		padding: 10px;
		width: 700px;
		font-weight: 600;
		height: 30px;
		line-height: 30px;
	}
	.modal_content {
		padding: 50px 10px 80px 10px;
		width: 700px;
		text-align: center;
		color: #363636;
		font-size: 25px;
		font-weight: 600;
		background-color: white;
		height: 70px;
		border-radius: 0px 0px 15px 15px;
	}
</style>
</head>
<body>
<div id="modal">
		<div class="modal_page">
			<div class="modal_title">회원 탈퇴</div>
			<div class="modal_content">정말 Freshcoffee를 <span style="color:tomato;">탈퇴</span>하시겠습니까?<br><br>
				<a href="#" class="no_btn">아니오</a>
				<a href="#" class="yes_btn">네</a>
			</div>
		</div>
	</div>
	
	<div class="body">
		<div class="logo">
			<img alt="로" src="${path}/resources/img/freshcoffee2.png">
		</div>
		<div class="body_title">
			회원탈퇴
		</div>
			 
		<div class="body_content">
			<p>"${sessionScope.name}"님의 회원 탈퇴시 아래의 조치가 취해집니다.</p>
			<p>1. 개인정보는 <span style="color: dodgerblue;">'개인정보 정책'따라 60일간 보관(잠김)되며</span>,
			 	60일이 경과된 후 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.
			<div class="content">2. 작성된 게시물은 삭제되지 않으며, 익명 처리 후 <span style="color: dodgerblue;">freshcoffee로 소유권이 귀속</span>됩니다.</div>
			<div class="content">3. 게시물 삭제가 필요한 경우에는 <span style="color: dodgerblue;">관리자(kj1111@freshcoffee.co.kr)</span>로 문의해 주시기 바랍니다.</div>
		</div>
		
		<form class="form" method="POST" action="${path}/member/deletePlay" id="frm_mem">
			<div class="pw_ck">
				<input type="password" placeholder="비밀번호"  id="pw">
			</div>
			<span class="pwAjax" style="color: tomato; display: none;">올바른 값을 입력해주세요.</span>
		</form>
		
		<div class="btn_area">
			<span><a href="${path}/" class="btn" id="cancel_btn">취소</a></span>
			<span><a href="#" class="btn" id="ok_btn">탈퇴</a></span>
		</div>
	</div>


<!--에러메시지에 스판에 바로 클래스로 pwAjax 설정해라  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var state = false;
		$('#pw').blur(function(){
			var nowId = "${sessionScope.userid}";
			var nowPw = $(this).val();
			
			state = ajaxPwCheck(nowId, nowPw);
			/* currentPw = ajaxPwCheck(); */
		});
		
		$('#ok_btn').click(function(){
			alert(state);
		
			if(state) {
				$('#modal').css('display','block');
			} else {
				$('#pw').focus();
			}
		});
		
		$('#no_btn').click(function(){
			$('#modal').css('display', 'none');
		});
		
		$('.yes_btn').click(function(){
			$('#frm_mem').submit();
		});
		
		
		
		
		
		
		/* $('#yes_btn').click(function({
			/* var id = "${sessionScope.loginUser.id}";
			location.href="dropMember.freshcoffee?id=" + id; */
			
			/*location.href="dropMember.freshcoffee"; */
		});
</script>
</body>
</html>