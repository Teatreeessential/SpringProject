<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">    
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>    
<!DOCTYPE html>
<html>
<head>
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h4>${exception.getMessage()}</h4>

 <ul>
 <c:forEach items="${exception.getStackTrace()}" var="stack">
 	<li>${stack.toString()}</li>
 </c:forEach>
 </ul>
</body>
</html>