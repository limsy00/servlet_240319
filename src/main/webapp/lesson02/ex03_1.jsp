<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post form 태그 - server page</title>
</head>
<body>
	<%
		String nickname = request.getParameter("nickname");
		String hobby = request.getParameter("hobby");
		String animal = request.getParameter("animal");
		// ✅여러개의 항복을 받을 때 .getParameterValues()
		String[] foodArr = request.getParameterValues("food"); 
		String fruit = request.getParameter("fruit");
	
	%>

	<table border="1">
		<tr>
			<th>별명</th>
			<td><%= nickname %></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%= hobby %></td>
		</tr>
		<tr>
			<th>선호 동물</th>
			<td><%= animal %></td>
		</tr>
		<tr>
			<th>선호 음식</th>
			<td>
				<% 
					if (foodArr != null) {
						String result = "";
						// ✅foodArr에 있는 항목 하나씩 꺼내서 변수(food)에 담기
						for (String food : foodArr) { 
							result += food + ",";  // 민트초코,번데기,
						} 
						// 맨 뒤에 붙은 (,) 제거 : a,b,c, ▷ a,b,c
						// abc ▷ ab만 추출 : ✅substring(0,2) → 2 = (문자열 길이 - 1)
						result = result.substring(0,result.length() - 1);
						out.print(result); // 민트초코,번데기
					}
				%>
			</td>
		</tr>
		<tr>
			<th>선호 과일</th>
			<td><%= fruit %></td>
		</tr>
	</table>
</body>
</html>