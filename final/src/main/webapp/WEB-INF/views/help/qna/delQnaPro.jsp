<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
</head>
<c:if test="${result == 0}">
	<script>
	  alert("1:1 문의 삭제에 실패했습니다. 비밀번호를 다시 입력해주세요!");
	  history.go(-1);
	</script>
</c:if>
<c:if test="${result >= 1}">
	<script>
		alert("1:1 문의 삭제가 완료되었습니다.");
		window.location="/help/qna/qnaList?board_type=3&pageNum=${pageNum}";		
	</script>
</c:if>
</body>
</html>