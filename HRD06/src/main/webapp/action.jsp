<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<% 

DTO dto = new DTO();
dto.setCdate( request.getParameter("cdate") );
dto.setCno( request.getParameter("cno") );
dto.setCarea( request.getParameter("carea") );
dto.setCprice( request.getParameter("cprice") );
dto.setTcode( request.getParameter("tcode") );

int result = new DAO().setSale(dto);

if(result == 1){
	out.println("<script> alert('수강신청이 정상적으로 완료되었습니다!'); location.href='index.jsp'; </script>");
}else if(result == -1 ){
	out.println("<script> alert('수강신청에 실패했습니다'); history.back(); </script>");
}else{
	out.println("<script> alert('오류가 있습니다'); history.back(); </script>");
}

%>