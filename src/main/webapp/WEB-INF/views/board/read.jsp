<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		const form = $("form[role='form']");
		var msg = '${msg}';
		//수정
		$(".btn-warning").on('click',function(){
			form.attr("action","/board/modify");
			form.attr("method","post");
			form.submit();
		})
		
		//삭제
		$(".btn-danger").on('click',function(){
			form.attr("action","/board/remove");
			form.submit();
		})
		//조회
		$(".btn-primary").on('click',function(){
			self.location = "/board/listAll";
		})
		if(msg){
			alert(msg);	
		}
	
		
	})
</script>
<body>
	<%@include file="../include/header.jsp" %>
	<form role="form" method="post">
		  <input type="hidden" name="bno" value="${one_board.bno}"/>
		  <div class="form-group">
		    <label for="exampleFormControlInput1">title</label>
		    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목" name="title"
		    value="${one_board.title}">
		  </div>
		  <div class="form-group">
		    <label for="exampleFormControlSelect1">content</label>
		    <textarea class="form-control" rows="3" placeholder="내용" name="content">${one_board.content}</textarea>
		  </div>
		  <div class="form-group">
		    <label for="exampleFormControlSelect2">writer</label>
		    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="글쓴이" name="writer"
		    value="${one_board.writer}" readonly="readonly">
		  </div>
	</form>
	<hr>
	<div class="box-footer">
		<button type="submit" class="btn btn-warning">Modify</button>
		<button type="submit" class="btn btn-danger">Remove</button>
		<button type="submit" class="btn btn-primary">LIST</button>
	</div>
	
		
</body>

</html>