<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.MemberDAO, com.example.bean.MemberVO,java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>free board</title>
	<link rel="stylesheet" href="member.css">
	<style>
		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		#list td, #list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align:center;
		}
		#list tr:nth-child(even){background-color: #f2f2f2;}
		#list tr:hover {background-color: #ddd;}
		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #006bb3;
			color: white;
		}
		.mb-3 {
			margin-bottom: 1rem!important;
		}
		.justify-content-end {
			justify-content: flex-end!important;
		}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='delete_ok.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>회원 관리 페이지 </h1>

<div class="d-flex justify-content-end mb-3">
	<a href="addpostform.jsp" class="btn btn-info" role="button" aria-pressed="true">회원 등록 추가 !</a>
</div>

<%
	MemberDAO boardDAO = new MemberDAO();
	List<MemberVO> list = boardDAO.getList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">

<tr>
	<th>No</th>
	<th>photo</th>
	<th>User ID</th>
	<th>User Name</th>
	<th>Email</th>
	<th>Detail</th>
	<th>Register date</th>
	<th>Edit</th>
	<th>Delete</th>


</tr>
<c:forEach items="${list}" var="u" varStatus="status">

	<tr>
		<td>${fn:length(list)-status.index}</td>
		<td><c:if test="${u.getPhoto() ne ''}"><br />
			<img src="${pageContext.request.contextPath }/upload/${u.getPhoto()}" alt="…" width="100px" height="100px" class="img-thumbnail"></c:if></td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getDetail()}</td>
		<td>${u.getRegdate()}</td>
		<td>
			<a href="editform.jsp?id=${u.getSid()}">Edit</a>
		</td>
		<td>
			<a href="javascript:delete_ok('${u.getSid()}')">Delete</a>
		</td>
	</tr>
</c:forEach>
</table>

</body>
</html>