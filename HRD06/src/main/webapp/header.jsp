<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{padding: 0;margin: 0;}
h1,h2,h3{
text-align: center;
padding:20px 30px;
}
ul {
	display: flex;
}
li{
	list-style: none;
	padding: 10px 20px;
}
a{
	text-decoration: none;
}
header{
background-color: gray;
}
body{
background-color: lightgray;
}
nav{
background-color: darkgray;
}
footer{
	background-color: gray;
	position: absolute;
	bottom: 0;
	width: 100vw;
}

table {
	margin : 30px auto;
}
th,td{
	padding :10px 30px;
	text-align: center;
} 
td.price{
	padding :10px 10px 10px 50px;
	text-align: right;
}
td.left{
	text-align: left;
}
input,select{
width:300px;
}
</style>
</head>
<body>
<header><h1>골프장 회원관리 프로그램 ver1.0</h1> </header>
<nav><ul>
<li><a href="tList.jsp">강사조회</a></li>
<li><a href="classForm.jsp">수강신청</a></li>
<li><a href="mList.jsp">회원정보조회</a></li>
<li><a href="cList.jsp">강사매출현황</a></li>
<li><a href="index.jsp">홈으로 </a></li>
</ul> </nav>
</body>
</html>