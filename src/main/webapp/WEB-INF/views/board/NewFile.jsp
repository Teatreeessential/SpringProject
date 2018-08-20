<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">    
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>  
<script src="<c:url value="/resources/handlebars-v4.0.11.js"/>"></script>  
<!DOCTYPE html>
<html>
<head>
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script id="template" type="text/x-handlebars-template">
	<span>{{name}}<span>
</script>
<script type="text/javascript">
$(document).ready(function(){
		var name = '안병찬' 
		var source = $("#template").html();
		var template = Handlebars.compile(source);
		var data = {name:"안병찬"}
		$("#display").html(template(data));
})
	
</script>
<body>
<%@include file="../include/header.jsp" %>
<div id="display">
</div>
</body>
</html>