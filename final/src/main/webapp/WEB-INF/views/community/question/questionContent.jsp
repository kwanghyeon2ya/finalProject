<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문글</title>
<script>
	function addMemberReport(pnum){
		window.open("/community/addMemberReportForm?pnum="+pnum, 
			"게시글 신고", "width=400, height=300, left=100, top=50"); 
	}
</script>
</head>
<body>
<c:import url="/navbar"/>
	<c:if test="${board.status != 0}">
		<c:if test="${memberStatus != 1}">
			<script>
				alert("삭제된 게시글 입니다.");
				history.go(-1);
			</script>
		</c:if>
	</c:if>
	<h1>질문글 글보기</h1>
	<input type="button" value="목록" class="btn btn-primary" style="float:right;margin-right:20%;margin-bottom:10px" 
		  onclick="window.location = '/community/question/questionList?board_type=5' " />
	<jsp:include page="/WEB-INF/views/board/boardContent.jsp" flush="false"/>
	<c:if test="${sessionScope.sid != null}">
		<input type="button" value="수정" class="btn btn-outline-primary"
			onclick="window.location = '/community/question/modQuestion?pnum=${board.pnum}&pageNum=${pageNum}' " />
		<input type="button" value="삭제" class="btn btn-outline-primary"
			onclick="window.location = '/community/question/delQuestion?pnum=${board.pnum}&pageNum=${pageNum}' " />
		<c:if test="${board.post_level == 0}">
			<input type="button" value="답글" class="btn btn-outline-primary"
				onclick="window.location = '/community/question/addQuestion?pnum=${board.pnum}&post_group=${board.post_group}' " />
		</c:if>
		<input type="button" class="btn btn-danger" value="신고" onclick="addMemberReport(${board.pnum});"/>
	</c:if>
	<br/><br/>
	
	<div>
		<jsp:include page="/WEB-INF/views/board/commForm.jsp" flush="false"/>
	</div>
	<br/><br/>
	<c:if test="${memberStatus == 1}">
		<c:import url = "/admin/board/reportDetails" />
	</c:if>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>