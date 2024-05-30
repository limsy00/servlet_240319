<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이변환 server page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
</head>
<body>
	<%
		int height = Integer.valueOf(request.getParameter("height"));
		String[] unitArr = request.getParameterValues("unit");
		
		double result;
		for (String unit : unitArr) {
			if (unit.equals("inch") == true) {
				result = height * 2.54;
			} 
			if (unit.equals("yard") == true) {
				result = height / 91.44;
			}
			if (unit.equals("feet") == true) {
				result = height / 30.48;
			}
			if (unit.equals("meter") == true) {
				result = height / 100.0;
			}
		}
	%>
	
	<div class="container">
		<h1>길이 변환 결과</h1>
		<div class="display-4">
			<%= height %>cm <hr>
			<%= height %>in <br>
			<%= height %>yd <br>
			<%= height %>ft <br>
			<%= height %>m
		</div>
		
		
	</div>
</body>
</html>