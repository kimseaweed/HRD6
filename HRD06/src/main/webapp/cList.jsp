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

<h2> 강사매출현황 </h2>
<table border="1">
<tr>
<th>강사코드</th>
<th>강의명</th>
<th>강사명</th>
<th>총매출</th>
</tr>

<% 
List<DTO> list = new DAO().getSale();
for(DTO dto : list){
%>
<tr>
<td><%= dto.getTcode() %></td>
<td><%= dto.getCname() %></td>
<td class="price"><%= dto.getTname() %></td>
<td class="price"><%= dto.getCprice() %></td>
</tr>
<% } %>
</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>