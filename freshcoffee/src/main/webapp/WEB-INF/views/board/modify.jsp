<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--   <%@ include file="${path}../iclude/header.jsp"%> --%>
  <%--   <c:if test="${sessionScope.loginUser == null}">
 	   <script>
 	   		alert("로그인 하 신 후 사용하세요. ");
 	   		location.href="${path}/boardList.freshcoffee?message=nologin";
 	   </script>
 	</c:if> --%>
 	<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<style type="text/css">
	.content {
		border: 1px solid #fec9c9;
		margin: 200px auto;
		width: 750px;
		text-align: left;
		border-radius: 5px;
		padding: 20px;
		border-top: 25px solid #fec9c9!important;
		padding-bottom: 40px;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		height: 900px;
	}
	h3 {
		margin-left: 25px;
	}
	h4 {
		margin-top:30px;
		margin-left: 25px;
		margin-bottom: 10px;
	}
	.title_input input {
		margin:0 25px 30px 0;
		margin-left: 25px;
		width: 690px;
		height: 25px;
	}
	.insert_Content {
		margin-left: 25px;
	}
	.insert_Content textarea {
		width:690px;
		height: 400px;
	}
	label {
		font-size: 17px;
		color: black;
		display: block;
	}
	.writer {
	 	margin-left: 25px;
	 	margin-bottom: 10px;
	}
	.content_MiniTitle input {
		width: 690px;
		height: 25px;
	}
	.writer {
		margin-top: 20px;
	}
	.update_Btn {
		float: right;
		margin-right: 25px;
		background-color: pink;
	}
	.file_Area {
		margin: 30px 0 0 0;
	}
	.file_Area input {
		margin-left:25px;
	}
	.update_Btn {
		width: 105px;
		height:30px;
	}
	.update_Btn > a {
		text-decoration: none;
		background-color: #FADAD8;
		display: inline-block;
		width:100px;
		height: 25px;
		color: white;
		text-align:center;
		line-height:25px;
	}
	.update_Btn > a:hover {
		background-color:#00dffc;
	}
	
</style>
</head>
<body>
	<header>
		
	</header>
	<section class="content">
		<div class="box">
			<form action="registerPlay.freshcoffee" name="" method="POST" enctype="multipart/form-data"> <!--첨부파일 보내려면 방식이 POST여야 함!  -->
				<div class="insert_title">
					<h3>Q & A 글 수정</h3>
					<label for="title"><h4>제목</h4></label>
					<span class="title_input"><input type="text" name="title" id="title" placeholder="제목을입력해주세요"></span>
					<span class="boardinsert_err"></span>
				</div>
	
				<div class="insert_Content">
					<label for="content"><div class="content_MiniTitle">내용</div></label>
					<textarea name="content" id="registerInsert" placeholder="내용을 입력해주세요!"></textarea>
						<script type="text/javascript">
							var oEditors = [];
							 nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "registerInsert",
							 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEdit2Skin.html",
							 fCreator: "createSEditor2"
							});
						</script>	
				</div>
				
				<div class="writer">
					<label for="writer"><div>작성자</div></label>
					<span class="content_MiniTitle">
						<input type="text"  readonly="readonly" name="writer">
					</span>
				</div>
				</form>

			<div class="file_Area">
				<span><input type="file" name="uploadfile" id="uploadfile" style="display:none">
					<input type="button" class="btn btn-file" value="파일선택">
					<span class ="files" id="file-name" style="height: 29px; border: none;">
					<span class="files basic_files">${one.filename}</span>
					<span class="file_msg">{첨부파일 삭제됨}</span>
					<i class="fas fa-check open_file_btn"></i>
					<i class="fas fa-times close_file_btn close_basic_btn"></i>
					<span id="now_file_size">
						<i class="fas fa-times" id="close_file_btn" style="display:none;"></i>
					</span>
				</span>
				<button class="update_Btn">게시글등록</button>
			</div>

		</div>
		
	</section>
	<footer>
		<%@ include file="../include/footer.jsp" %>
	</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var title = $("#title").val();
		var content = $("#registerInsert").val();
		
		
		 if(title == "<p><br></p>") {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}else if(content == "<p><br></p>") {
			alert("내용을 입력해주세요");
			return false;
			$("#registerInsert").focus();
		}else if (id == null) {
			alert("로그인을 해주세요");
		}else {
			$.ajax({
				url: "modify.freshcoffee",
				type: "POST",
				data: $("#frm_reply").serialize(),
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success: function() {
					comment_list();
					$("#replyInsert"),val(""); // AJAX이므로 페이지 원복 하기때문에 댓글 등록에 등록하려고 했던 내용이 그대로 남아있기 때문에 없애줘야한다.
				},
				error: function() {
					slert("System Error!!");
				}
			}); 
		}
	});
	
	$(document).on("click", ".btn-file", function(){
		$("#uploadfile").click();
	});
	
	$(document).on("change", "#uploadfile", function(){
		var filesize = $(this)[0].files;
		if(filesize.length < 1) {
			$('#file_name').text("선택된 파일 없음");
			$("#close_file_btn").css('display', 'none');
		}else {
			var filename = this.files[0].name;
			var size = this.files[0].size;
			var maxSize = 30 * 1024 * 1024;
			
			if(size > maxSize){	
				alert("첨부파일 사이즈는 30MB 이내로 등록 가능합니다");
				$("#file_name").text("선택된 파일 없음");
				$("#uploadfile").val(""); //30mb이상이여도 올려버린다 따라서 초기화를 해줘야 한다
				$("#now_file_size").text("");
			} else {
				$("#file_name").text(filename);
				var formSize = size/(1024*1024);
				$("#now_file_size").text("("+formSize.toFixed(2) + "mb)");
				$("#close_file_btn").css("display", "block");
			}
		}
		
	
	});
	
	$(document).on("click", '#close_file_btn', function(){
		$("#uploadfile").replaceWith($("#uploadfile").clone(true));
		$("#uploadfile").val("");
		$('#now_file_size').text("");
		$("#file_name").text("선택된 파일 없음");
		$("#close_file_btn").css("display", "none");
	});
	
	$(document).on('click', 'close_basic_btn', function(){
		$('.file_msg').css('display', 'block');
		$('.basic_files').css('color', '#AAA').css('text-decoration', 'line-through');
	});
	
	$(document).click('.update_Btn')function(){
		alert("test");
	});
</script>
</body>
</html>