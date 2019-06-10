<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %> 
<<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Caveat|Yeon+Sung');
	*,body {
		margin: 0;
		padding: 0;
		font-family: 'Yeon Sung', cursive;
	}
	.content {
		width: 1000px;
		box-sizing: border-box;
		border: 1px solid black;
		margin: 230px auto;
		border-radius: 15px;
		padding: 15px;
	}
	.table {
		width: 950px;
		border: 1px solid black;
		border-collapse: collapse; 
	}
	th. td {
		border: 1px solid black;
		font-family: 'Yeon Sung', cursive;
	}
	th {
		height: 35px;
		background-color: pink;
		text-align: center;
		color: white;
	}
	td {
		height: 35px;
		text-align: center;
		background-color: white;
	}
	td:nth-child(2) {
		text-align: left;
		padding-left: 10px;
	}
	.btn {
		padding: 7px 15px;
		font-size: 14px;
		border-radius: 20px;
		background-color: skyblue;
		color:white;
		border:0;
		float: right;
		outline: none;
		position: relative;
	}
	.btn:hover {
		background-color: orange;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
	}
	.pagination > li {
		display: inline-block;
		border: 1px solid black;
		height: 20px;
		text-align: center;
		border-radius: 4px;
		vertical-align: center;
	}
	.pagination a {
		width: 20px;
		padding: 0 7px;
		line-height: 24px;	
		background-color: white;
		color: black;	
	}
	a {
		text-decoration: none;
		color: black;
	}
	.text_center {
		text-align: center;
	}
	.board_pagination {
		clear: both;
		text-align: center;
	}
	.active {
		background-color: #2c3e50;
		color: white;

	}
	#div_search {
		float: right;
		margin:10px 0 20px;
	}
	#searchboard {
		height: 29px;
		width: 200px;
		margin:0 10px;
		border: 1px solid #cccccc;
		border-radius: 20px;
		outline: none;
		padding-left: 8px;
	}
	.btn_Search {
		margin-top: 0;
	}
	#selsearch {
		height: 29px;
		width: 100px;
		font-size: 15px;
		float: left;
		border-radius: 20px;
		outline: none;
	}
	.new_Time {
		background-color: #ff8224;
		font-size: 11px;
		color: white;
		border-radius: 20px;
		padding: 2px 5px;
		animation-name: twinkle;
		animation-duration: 1.2s;
		animation-iteration-count: infinite; 
	}
	.replyCnt_color {
		background-color: rgb(231, 29, 54);
		font-size: 11px;
		color:white;
		border-radius: 20px;
		padding:2px 5px;
	}
	@keyframes twinkle {
    0%   {opacity: 0;}
    100% {opacity: 1;}
	}
	.box h3 {
		margin: 20px 0 10px 0;
		display: block;
		font-size: 30px;
		font-family: 'Caveat', cursive!important;
	}
	.box-body {
		margin-top: 7px;
	}
	#orderGood {
		background-color: #FF0000;
	}
	#order_board {
		display: inline-block;
	}
	#order_board > span {
		margin-right: 8px;
		display: inline-block;
		height: 29px;
		line-height: 40px;
	}
	#orderGood i {
		font-size: 12px;
		margin-right: 2px;
		display: inline-block;
	}
	.pagination * {
		font-family: 'Sunflower', sans-serif!important;
		display: inline-block;
		height: 24px;
	}
	#search_result {
		width: 500px;
		margin: 0px 0px;
		display: inline;
		
	}
	
</style>
</head>
<body>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<h3>Q & A</h3>
				</div>
				<div>
					<div id="order_board">
						<span>
							<a href="${path}/board/list?sort_option=new&search_option=${map.search_option}&keyword=${map.keyword}" id="orderNew">최신순</a>
						</span>
						<span>
							<a href="${path}/board/list?sort_option=good&search_option=${map.search_option}&keyword=${map.keyword}" id="orderGood">추천순</a>
						</span>
						<span>
							<a href="${path}/board/list?sort_option=reply&search_option=${map.search_option}&keyword=${map.keyword}" id="orderReply">댓글순</a>
						</span>
						<span>
							<a href="${path}/board/list?sort_option=view&search_option=${map.search_option}&keyword=${map.keyword}" id="orderCnt">조회순</a>
						</span>
					</div>
					<c:if test="${!empty keyword}">
						<div id="search_result">
							<span class="search_span">"${keyword}</span>로 검색한 결과는 총
							<span class="search_span">${totalCount}</span>건입니다.
						</div>
					</c:if>
					
					<button id="boardAdd" class="btn btn-Primary">게시글 등록</button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-boarded">
					<tbody>
					<tr style="width:12px">
						<th style="width: 50px">No.</th>
						<th style="width: 450px">제목</th>
						<th style="width: 150px">작성자</th>
						<th style="width: 130px">작성일</th>
						<th style="width: 60px">좋아요</th>
						<th style="width: 60px">조회수</th>
						<th style="width: 60px">첨부</th>
					</tr>
					
					<c:forEach items="${map.list}" var="bDto">
						<tr>
							<jsp:useBean id="now" class="java.util.Date"/>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
							<fmt:formatDate value="${bDto.regdate}" pattern=""/>
							<td class="text_center" style="background-color: white;">${bDto.bno}</td>
							<td style="background-color: white;" class="title_table">
								<a href="#">
									${bDto.title}
									<span class="replyCnt_color">${bDto.replycnt > 0}</span>
									<span class="new_Time">New</span>
								</a>
							</td>
							<td style="background-color: white;">${bDto.writer}</td>
							<td style="background-color: white;" class="text_center">
								${bDto == regdate}
							</td>
							<td style="background-color: white;" class="text_center">
								<span>
									<i class="fa fa-heart">
									</i>
									${bDto.goodcnt}
								</span>
							</td>
							<td style="background-color: white;" class="text_center">${bDto.viewcnt}</td>
							<td style="background-color: white;" class="text_center"></td>
						</tr>
					</c:forEach>

					
			</tbody>
		</table>

		<div id="div_search">
			<select id="selsearch" name="selsearch">
				<option value="all" selected="selected">제목+내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" placeholder="검색할내용을 입력해주세요!" name="searchboard" id="search_board">
			<a href="#" id="search_Btn" class="btn btn_Search">검색</a>
		</div>

		<div class="board_pagination">
			<ul class="pagination">
				<c:if test="${map.pager.curBlock > 1}">
					<li class="active">
						<a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}" ><i></i></a>
						<a href="${path}/board/list?curPage=${map.pager.blockBegin - 10 }&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}" ><i></i></a>
					</li>
				</c:if>
				
				<c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}" var="idx">
					<li class="active">
						<a href="${path}/board/list?curPages=${idx}&sort_option=${map.sort_option}&keyword=${map.keyword}"><i class="fas fa-angle-double-right"></i></a>
						<c:out value="${map.pager.curPage == idx ? class=active: ''}"/>
					</li>
				</c:forEach>
				
			</ul>
		</div>
			</div>
		</div>
	</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on("click", "#search_Btn", function(){
		var search_option = $('#selsearch').val();
		var keyword = $.trim($('#search_board').val());
		alert(search_option + "," + keyword);
		
		if (keyword == null || keyword.length == 0) {
			$('#search_board').focus();
			$('#search_board').css('border', '1px solid rgb(231,2)')
			return false;
		}
		location.href="${path}/boardList.freshcoffee?search_option="+search_option+"&keyword="+keyword;
		$("#boardAdd").on("click", function(){
			$.ajax({
				url: "registerAjax.freshcoffee",
				type: "POST",
				dataType: "json",
				success: function() {
					if (data.message == "1") {
						location.gref ="registerView.freshcoffee"
					}else {
						$("#modal_all"),css("disply", "block");
						$("#err_msg").css("display", "block").text("로그인이 필요한 서비스입니다");//로그인 창의 에러메세지에서 출력되어야 함
					}
				},
				error: function() {
					slert("System Error!!");
				}
			});
		});
	});
</script>
</body>
</html>