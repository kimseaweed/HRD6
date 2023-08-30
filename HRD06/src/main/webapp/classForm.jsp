<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>

		<h2>수강신청</h2>
		<form action="action.jsp" name="memberForm">
			<table border="1">

				<tr>
					<th>수강월</th>
					<td><input type="text" name="cdate"> 2022년03월 예)202203
					</td>
				</tr>

				<tr>
					<th>회원명</th>
					<td class="left"><select name="mname" onchange="getcode()">
							<option value="">회원명</option>
							<option value="10001">홍길동</option>
							<option value="10002">장발장</option>
							<option value="10003">임꺽정</option>
							<option value="20001">성춘향</option>
							<option value="20002">이몽룡</option>
					</select></td>
				</tr>

				<tr>
					<th>회원번호</th>
					<td class="left"><input type="text" name="cno"> 예)10101</td>
				</tr>

				<tr>
					<th>강의장소</th>
					<td class="left"><input type="text" name="carea"></td>
				</tr>

				<tr>
					<th>강의명</th>
					<td class="left"><select name="tcode" onchange="getClassinfo()">
							<option value="">강의신청</option>
							<option value="100">초급반</option>
							<option value="200">중급반</option>
							<option value="300">고급반</option>
							<option value="400">심화반</option>
					</select></td>
				</tr>

				<tr>
					<th>수강료</th>
					<td class="left"><input type="text" name="cprice"> 원</td>
				</tr>

				<tr>
					<td colspan="2" ><input type="button" value="수강신청"
						onclick="submitForm();"> <input type="reset"
						onclick="alert('정보를 지우고 처음부터 다시 입력합니다!'); document.memberForm.cdate.focus()"
						value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />

	<script type="text/javascript">
		function getcode() {
			document.memberForm.cno.value = document.memberForm.mname.value;
			getClassinfo();
		}

		function getClassinfo() {
			if(document.memberForm.mname.value==""){
				document.memberForm.cprice.value == ""
				return
			}
			var cprice;
			switch (document.memberForm.tcode.value) {
			case "": return;
			case "100": 
				cprice = 100000
				break;
			case "200": 
				cprice = 200000
				break;
			case "300": 
				cprice = 300000
				break;
			case "400": 
				cprice = 400000
				break;
			}
			if(parseInt(document.memberForm.cno.value)>19999){
				alert('vip 고객! 원가 :  ' + cprice + ', 할인가 : '+ cprice/2);
				cprice /=2;
			}else{
			}
			document.memberForm.cprice.value = cprice;
		}

		function submitForm() {
			if(document.memberForm.cdate.value =="" ){
				alert('수강월이 입력되지 않았습니다');
				document.memberForm.cdate.focus();
			}else if(document.memberForm.mname.value =="" ){
				alert('회원명이 선택되지 않았습니다');
				document.memberForm.mname.focus();
			}else if(document.memberForm.cno.value =="" ){
				alert('회원번호가 입력되지 않았습니다');
				document.memberForm.cno.focus();
			}else if(document.memberForm.carea.value =="" ){
				alert('강의장소가 입력되지 않았습니다');
				document.memberForm.carea.focus();
			}else if(document.memberForm.tcode.value =="" ){
				alert('강의명이 선택되지 않았습니다');
				document.memberForm.tcode.focus();
			}else if(document.memberForm.cprice.value =="" ){
				alert('수강료가 입력되지 않았습니다');
				document.memberForm.cprice.focus();
			}else{
			document.memberForm.submit();
			}
			
		}
	</script>

</body>
</html>