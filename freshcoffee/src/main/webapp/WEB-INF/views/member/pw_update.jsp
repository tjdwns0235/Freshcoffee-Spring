<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<style type="text/css">
	section {
		border-top: 1px solid #dadada;
	}
	.pw_title {
		text-align: center;
	}
	.pw_Update_inner_Section {
		margin: 0 auto;
		width: 1440px;
		height: auto;
		text-align: center;
		background-color: white; 
	}
	.join_menu {
		width: 550px;
		margin: 0 auto;
		margin-top: 20px;
	}
	.join_menu:nth-child(1) {
		margin-top: 20px;
	}
	.join_Mini_Menu {
		text-align: left;
	}
	.join_menu input {
		width: 350px;
		height: 25px;
		font-size: 15spx;
		padding: 10px;
		border-radius: 3px;
		border: 1px solid #dadada;
	}
	.join_menu > span {
		display: block;
		font-size: 14px;
		color: tomato;
		text-align: left;
	}
	.pw_update_Btn {
		display: flex;
		width: 550px;
		margin: 20px auto;
		height: 60px;
		line-height: 30px;
		justify-content:  space-between;
	}
	.cancel_Btn {
		flex: 1;
		color: white;
		background-color: pink;
		font-size: 20px;
		height: 30px;
		cursor: pointer; 
		margin-right: 10px;
		text-decoration: none;
	}
	.btn_agree {
		flex: 1;
		color: white;
		background-color: skyblue;
		font-size: 20px;
		height: 30px;
		text-decoration: none;
	}
</style>
</head>
<body>
<!--에러메시지에 클래스로 pwAjax 설정해라  -->
	<header>
		<div class="pw_title">
			<h2>비밀번호 수정</h2>
		</div>
	</header>

	<section>
		<div class="pw_Update_inner_Section">
			<form action="" method="POST" class="form">
				<div class="join_menu">
					<div class="join_Mini_Menu">
						<label for="now_pw">비밀번호</label>
						<input type="password" id="now_pw" name="now_pw" maxlength="20" class="input_box" placeholder="현재비밀번호">
					</div>
					<span class="err_msg">올바른 값을 입력해주세요</span>
				</div>

				<div class="join_menu">
					<div class="join_Mini_Menu">
						<label for="new_pw">새로운비밀번호</label>
						<input type="password" id="new_pw" name="new_pw" maxlength="20" class="input_box" placeholder="새로운비밀번호">
					</div>
					<span class="err_msg">올바른 값을 입력해주세요</span>
				</div>

				<div class="join_menu">
					<div class="join_Mini_Menu">
						<label for="now_pw">새로운비밀번호 재확인</label>
						<input type="password" id="new_rpw" name="new_rpw" maxlength="20" class="input_box" placeholder="새로운비밀번호 확인">
					</div>
					<span class="err_msg">올바른 값을 입력해주세요</span>
				</div>
			</form>

			<div class="pw_update_Btn">
				<a href="#" class="cancel_Btn">취소하기</a>
				<a href="#" class="btn_agree">변경하기</a>
			</div>
		</div>
	</section>

	
	<input name="id" type="hidden" value="${sessionScope.loginUser.id}">  <!--form태그 밑에 둔다 2번째 방법  -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var currentPw = false;
		var newPwEq = false;
	
	 	$(document).on("blur", "#pw_now", function(){
	 		//Ajax를 활용하여 입력한 비번과 현재 비번이 일치하는지 확인
	 		
	 		var nowPw = $("#pw_now").val(); //입력한 비밀번호
	 		var nowId = "${sessionScope.loginUser.id}";
	 		
	 		if (nowPw != null || nowPw.length != 0) {
				currentPw = ajaxPwCheck();
			}
	 	});
	 			
	 			$('.btn_agree').click(function(){
	 				var postPw = $('#pw_now').val(); //현재 비밀번호의 #(ID)
	 				var newPw = $('#inputpw').val();
	 				
	 				
	 				if (!currentPw) {
	 				// 1.현재비밀번호가 맞는지 확인
	 					$('#pw_now').focus();
						return false;
					} else if (!newPwEq) {
						$('#inputpw').focus();
						// 2. 새비밀번호와 새비밀번호 확인 유효성 체크
						return false;
					} else if(postPw == newPw) {
						// 3. 현재비밀번호와 새 비밀번호가 같으면 체크
						//alert(postPw + "," + newPw);
						$('#inputpw').focus();
						$('#inputpw').next().test('현재비밀번호와 다르게 입력해주세요')
											.css('display', 'block')
											.css('color','tomato');
						return false;
					}
	 				
	 					
	 			
	 				$('#frm_mem').submit();
	 			});
	 	});
});
	</script>
</body>
</html>