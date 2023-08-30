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

<h2> 강사조회 </h2>
<table border="1">
<tr>
<th>강사코드</th>
<th>강사명</th>
<th>강의명</th>
<th>수강료</th>
<th>강사자격취득일</th>
</tr>

<% 
List<DTO> list = new DAO().getTeacher();
for(DTO dto : list){
%>
<tr>
<td><%= dto.getTcode() %></td>
<td><%= dto.getTname() %></td>
<td><%= dto.getCname() %></td>
<td><%= dto.getCprice() %></td>
<td><%= dto.getCdate() %></td>

</tr>
<% } %>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>