<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
		</div>
			
			
			<c:forEach items="${replyList}" var="replyview">
				<div class="reply_List">
					<div class="reply_line1" style="width: 600px;">
						<a href="#" class="replay_writer">작성자:${replyview.writer}</a>
						<c:if test="${sessionScope.userid == replyview.writer}">
							<a class="reply_del" data_num="${replyview.rno}">삭제</a>
						</c:if> 
						<span id="replyList_Date">
							<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${replyview.regdate}"></fmt:formatDate>
						</span>
					</div>
						${replyview.content}
				</div>
			</c:forEach>
					
			<c:choose>		
		 		<c:when test="${empty sessionScope.userid}">
					<div class="reply_login" id="reply_nologin">
						<span class="reply_nologin_span">
							<a href="#" class="reply_logina">로그인</a>
							 을 하시면 댓글을 등록할 수 있습니다."
						</span>
					</div>
				</c:when>
			
				<c:otherwise>
					<form action="${path}/reply/create" method="POST" name="frm_reply" id="frm_reply">
						<div class="reply_btn">
							<span>작성자: ${replyview.writer}</span>
							<textarea id="replyInsert" name="content" class="replylist_textarea" placeholder="댓글을 남겨보세요"></textarea>
							<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "replyInsert",
							 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
							 fCreator: "createSEditor2"
							});
						</script>
							<a class="reply_btn">댓글 등록</a>
								
							<input type="hidden" name="writer" value="${sessionScope.userid}">
							<input type="hidden" name="bno"  id="re_bno">
						</div>
					</form>
				</c:otherwise>
			</c:choose>	
		
					
			
		</div>
		
		

</body>
</html>