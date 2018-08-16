<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		console.log(${last_page});
		console.log(${current_page});
		var msg = '${msg}';
		if(msg){
			alert(msg);	
		}
		
	})
</script>
<body>
<%@include file="../include/header.jsp" %>
<table class="table">
  <thead>
    <tr>
      <th scope="col">bno</th>
      <th scope="col">title</th>
      <th scope="col">writer</th>
      <th scope="col">regdate</th>
      <th scope="col">viewcnt</th>
     </tr>
  </thead>
  <c:forEach items="${board_list}" var="BoardVO">
    <tr>
      <td>${BoardVO.bno}</td>
      <td><a href="/board/read?bno=${BoardVO.bno}">${BoardVO.title}</a></td>
      <td>${BoardVO.writer}</td>
      <td><fmt:formatDate pattern="yyyy-mm-dd HH:mm" value="${BoardVO.regdate}"/></td>
      <td>${BoardVO.viewcnt}</td>
    </tr>
   </c:forEach>
</table>
<hr>
<nav aria-label="...">
  <ul class="pagination">
  	 <c:set var="current_page" value="${current_page}"/>
	 <c:set var="last_page" value="${last_page}"/>
	 
	 <c:choose>
	 	<c:when test="${current_page!=1}">
		  	<li class="page-item"><a class="page-link" href="/board/listAll?page=${current_page-1}">Previous</a></li>
	    </c:when>
	    <c:when test="${current_page==1}">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1">Previous</a>
		    </li>
	    </c:when>
    </c:choose>
    
    <c:forEach var="i" begin="${start_page}" end="${end_page}" step="1" varStatus="status">
    	<c:choose>
	    	<c:when test="${current_page==i}">
	    		<li class="page-item active">
	      			 <span class="page-link">${i}<span class="sr-only">(current)</span></span>
	    		</li>
			</c:when>
			
			<c:otherwise>
	    		<li class="page-item"><a class="page-link" href="/board/listAll?page=${i}">${i}</a></li>
	    	</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:choose>
		
		<c:when test="${current_page!=last_page}">
		  	<li class="page-item">
		  		<a class="page-link" href="/board/listAll?page=${current_page+1}">Next</a>
		  	</li>
	    </c:when>
	    
	    <c:when test="${current_page==last_page}">
		    <li class="page-item disabled">
		      	<a class="page-link" href="#" tabindex="-1">Next</a>
		    </li>
	    </c:when>
    </c:choose>
	
    
  </ul>
</nav>

<hr>
  <a href="/board/register"><span class="btn btn-primary">글쓰기</span></a>
</body>
</html>