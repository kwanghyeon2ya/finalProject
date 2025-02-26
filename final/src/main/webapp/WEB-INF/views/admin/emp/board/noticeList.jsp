<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<meta charset="UTF-8">
	<title>직원공지 목록</title>
</head>

<body>
	<jsp:include page="../../adminNavBar.jsp"/>
	<section style="margin: 20px 100px 50px 200px">
		<h1>직원공지 [total : ${count}]</h1>
		<input type="button" class="btn btn-outline-primary" value="공지등록" onclick="window.location='/admin/emp/addNotice'">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${count == 0}">
					<tr>
						<td colspan=5 style="text-align: center">공지글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.ebnum }</td>
						<td>
							<a href="/admin/emp/notice?ebnum=${dto.ebnum }">${dto.subject}</a>
						</td>
						<td>${dto.writer }</td>
						<td>
							<fmt:formatDate pattern="yy/MM/dd" value="${dto.reg }"/>
						</td>
						<td>${dto.readCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${count > 0}">
			<c:set var="pageCount" value="${count / page.pageSize + ( count % page.pageSize == 0 ? 0 : 1)}"/>
			
			<!-- int만 나올 수 있도록 fmt 통해서 포맷팅해줌 -->
			<fmt:parseNumber var="result" value="${page.currentPage/10}" integerOnly="true"/>
			<c:set var="startPage" value="${result*10+1}"/>
			
			<c:set var="pageBlock" value="${10}"/>
			<c:set var="endPage" value="${startPage + pageBlock-1}"/>
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>
		    
		    <ul class="pagination justify-content-center">		   
		    	<c:if test="${startPage > 10 }">
		    		<li class="page-item">
		       			<a class="page-link" href="/admin/emp/noticeList?pageNum=${startPage-10}">[이전]</a>
		       		</li>
		       	</c:if>
		       
		       	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1" >
		       		<li class="page-item">
		       			<a class="page-link" href="/admin/emp/noticeList?pageNum=${i}">[${i}]</a>
					</li>
				</c:forEach>
			
				<c:if test="${endPage < pageCount}">
					<li class="page-item">
		       			<a class="page-link" href="/admin/emp/noticeList?pageNum=${startPage + 10}">[다음]</a>
					</li>
				</c:if>
			</ul>
	    </c:if>
	</section>
</body>
