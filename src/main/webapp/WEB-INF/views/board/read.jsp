<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">    


<script src="<c:url value="/resources/handlebars-v4.0.11.js"/>"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
	<%@include file="../include/header.jsp" %>
	<form role="form" method="post">
		  <input type="hidden" name="bno" value="${one_board.bno}"/>
		  <input type="hidden" name="keyword" value="${keyword}">
		  <input type="hidden" name="searchType" value="${searchType}">
		  <input type="hidden" name="page" value="${current_page }">
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
	<hr>
	
	<div  class="row">
		<div class="col-md-12">
			<div class="box-header">
				<h3 class="box-title">ADD NEW REPLY</h3>
			</div>
			<div class="box-body">
				<label for="newReplyWriter">Writer</label>
				<input class="form-control" type="text" placeholder="user_id" id="newReplyWriter">
				<label for="newReplyText">ReplyText</label>
				<input class="form-control" type="text" placeholder="user_id" id="newReplyText">
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
			</div>
		</div>
	</div>
	
	<hr>
	<ul class="timeline">
		<li class="time-label"  id="repliesDiv"><span class="bg-green">replies list</span></li>
	</ul>
	
	<div class="text-center">
		<ul id="pagenation" class="pagination pagination-sm no-margin">
		</ul>
	</div>
	
	<!-- MODAL -->
<div id="modifyModal" class="modal modal-primary fade"  role="dialog" data-backdrop="false">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
       	<button type="button" class="btn btn-info" id="reply_modify">modify</button>
		<button type="button" class="btn btn-danger" id="reply_delete">delete</button>
		<button type="button" class="btn btn-default" id="modal_close">close</button>
      </div>
    </div>
  </div>
</div>
		
</body>

<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script id="template" type="text/x-handlebars-template">

<ul class="list-group">
  {{#each.}}
  <li class="replyLi list-group-item d-flex justify-content-between align-items-center" data-rno={{rno}}>
  	<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
	<div class="timeline-body">{{replytext}}</div>
	<div class="timeline-footer">
	<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
	</div>
  </li>
  {{/each}}	 
</ul>
</script>
<script type="text/javascript">

	$(document).ready(function(){
		var bno = ${one_board.bno};
		var replyPage = 1;
		const form = $("form[role='form']");
		var msg = '${msg}';
		//템플릿 파싱
		function printData(replyArr,target,templateObject){
			let template = Handlebars.compile(templateObject.html());
			
			let html = template(replyArr);
			$('.replyLi').remove();
			target.after(html);
		}
		//페이징 처리
		function printpaging(start_page,end_page,max_page,current_page){
			let str = "";
			if(max_page < end_page){
				//max_page 까지 for문 돌려서 보여줌 그리고 화살표는 max_page일때 disable로 1일때 disable
				for(let i = start_page; i<=max_page; i++){
					let strClass = current_page === i? 'class="page-item active"':'';
					str += "<li"+strClass+"><a href='"+i+"'>"+i+"</a></li>";
				}
				
			}else{
				//end_page까지 for문돌려서 보여준다.화살표는 able로 disable
				for(let i = start_page; i<=end_page; i++){
					let strClass = current_page === i? 'class="page-item active"':'';
					str += "<li"+strClass+"><a href='"+i+"'>"+i+"</a></li>";
				}
			}
			$('#pagenation').html(str);
		}
		//모든 댓글 조회 페이징을 한 뒤
		function getpageList(page){
			$.getJSON("/replies/"+bno+"/"+page,function(data){
				printData(data.list,$("#repliesDiv"),$("#template"));
				printpaging(data.start_page,data.end_page,data.max_page,data.page);
				
				$('#modifyModal').modal('hide');
				
			});
			
		}
		//페이징된 번호 클릭시
		$('#pagenation').on('click',"li a",function(){
			event.preventDefault();
			let page=$(this).attr("href")
			getpageList(page);
		})
		
		//댓글 조회 페이지 가져오기
		$("#repliesDiv").on('click',function(){
			if($(".timeline li").size()>1){
				return;
			}
			getpageList(1)
			//댓글 조회를 클릭했을 때 항상 1페이지가 나오도록 해야한다.
		})
		//댓글 등록
		$("#replyAddBtn").on('click',function(){
			let replyer = $("#newReplyWriter").val();
			let replytext =$("#newReplyText").val();
			
			$.ajax({
				type:'post',
				url:'/replies',
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data: JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result){
					if(result=='SUCCESS'){
						alert('등록되었습니다.');
						$("#newReplyWriter").val("");
						$("#newReplyText").val("");
						getpageList(1);
					};
				}
				
			})
		})
		//댓글삭제
		$("#reply_delete").on('click',function(){
			let rno = $(".modal-title").html(); 
			$.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType:'text',
				success: function(result){
					if(result == "SUCCESS"){
						alert("삭제 되었습니다.")
						getpageList(replyPage);
					}
				}
				
			});
		});
		//댓글수정
		$("#reply_modify").on('click',function(){
			let rno = $(".modal-title").html();
			let replytext = $("#replytext").val();
			
			$.ajax({
				type:'patch',
				url:'/replies/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PATCH"},				
				data:JSON.stringify({replytext:replytext}),
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert("수정 되었습니다.");
						getpageList(replyPage);
						
					}
				}
			})
			
		})
		
		//모달을 닫습니다.
		$("#modal_close").on('click',function(){
			$("#modifyModal").modal('hide');
		})
		
		//해당 메서드를 통해서 모달에 데이터를 넣는다.
		$(".timeline").on("click",".replyLi",function(event){
			var reply = $(this);
			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rno"))
		})
		
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
			form.attr("method","get");
			form.attr("action","/board/list");
			form.submit();
			
		})
		if(msg){
			alert(msg);	
		}
		
		
	})
</script>
</html>