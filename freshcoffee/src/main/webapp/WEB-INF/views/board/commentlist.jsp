<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="commentList">
		<div id="reply_Wrap_title">
			<span id="knboard_detail_rspan">댓글 ${replyList.size()}</span>
		</div>
		
		
		<div id="detail_replay">
			<c:if test="${replyList.size() == 0}">
				<div class="reply_List">
					<div class="reply_line2">
						등록된 댓글이 없습니다
					</div>
				</div>
			</c:if>
			
			
			<c:forEach items="${replyList}" var="replyview">
				<div class="reply_List">
					<div class="reply_line1" style="width: 600px;">
						<a href="#" class="replay_writer">작성자:${replyview.writer}</a>
						<c:if test="${sessionScope.loginUser.id == replyview.writer}">
							<a class="reply_del" data_num="${replyview.rno}">삭제</a>
						</c:if> 
						<span id="replyList_Date">
							<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${replyview.date}"></fmt:formatDate>
						</span>
					</div>
			</c:forEach>
					
			<c:choose>		
		 		<c:when test="${empty sessionScope.loginUser}">
					<div class="reply_login" id="reply_nologin">
						<span class="reply_nologin_span">
							<a href="#" class="reply_logina">로그인</a>
							 "을 하시면 댓글을 등록할 수 있습니다."
						</span>
					</div>
				</c:when>
			</c:choose>	
				<div class="reply_line2">
					<div class="replyList_textarea" id="replyList_textarea">
					${replyview.content}
					</div>
				</div>
					
					
					<form action="replyAdd.freshcoffee" method="POST" name="frm_reply" id="frm_reply">
					<div class="reply_btn">
						<textarea rows="" cols="150" id="replyInsert" name="re_textarea" class="replylist_textarea" placeholder="댓글을 남겨보세요"></textarea>
						<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "replyInsert",
							 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEdit",
							 fCreator: "createSEditor2"
							});
						</script>
						<a class="reply_btn">댓글 동록</a>
						
						<input type="hidden" name="re_writer" value="${sessionScope.loginUser.id}">
						<input type="hidden" name="re_bno" id="re_bno">
					</div>
				</div>
			</form>
		</div>
		
		
	</div>

</body>
</html>