<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01 - jsp</title>
</head>
<body>
	<!-- HTML 주석 - 소스보기에서 보임 -->
	<%-- JSP 주석 내용 - 소스 보기에서 안 보임--%>
	
	<%
		// 자바 문법 시작 - main()
		// scriptlet -> 앞으로 쓰지 않는 문법
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
		    sum += i;
		}
	%>
	
	<b>합계: <%= sum %></b><br>
	<input type="text" value="<%= sum %>"><br>
	
	<%!
		// 선언문 - class 느낌(예:Persomn)
		// 필드
		private int num = 10;
		// 메소드
		public String getHelloWorld() {
        return "Hello World";
    	}
	%>
	<%= getHelloWorld() %><br>
	<%= num + 200 %>
	
	
</body>
</html>