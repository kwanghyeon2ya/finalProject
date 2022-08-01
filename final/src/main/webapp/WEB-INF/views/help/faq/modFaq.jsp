<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
</head>
<body>
	<c:import url="/navbar"/>
	<section style="margin: 20px 10% 10% 10%">
		<h1>자주하는 질문 수정</h1>
		<form action="/help/faq/modFaqPro" method="post" onSubmit="return check()">
			<jsp:include page="/WEB-INF/views/board/modBoardForm.jsp" flush="false"/>
		</form>
	</section>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
