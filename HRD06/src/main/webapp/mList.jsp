<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>

<h2> 회원정보조회 </h2>
<table border="1">
<tr>
<th>수강월</th>
<th>회원번호</th>
<th>회원명</th>
<th>강의명</th>
<th>강의장소</th>
<th>수강료</th>
<th>등급</th>
</tr>

<% 
List<DTO> list = new DAO().getMember();
for(DTO dto : list){
%>
<tr>
<td><%= dto.getCdate() %></td>
<td><%= dto.getCno() %></td>
<td><%= dto.getMname() %></td>
<td><%= dto.getCname() %></td>
<td><%= dto.getCarea() %></td>
<td><%= dto.getCprice() %></td>
<td><%= dto.getGrade() %></td>

</tr>
<% } %>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>