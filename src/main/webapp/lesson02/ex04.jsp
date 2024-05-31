<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문 사용</title>
</head>
<body>
	<%
		// Map ▶ table로 표현!
		// {"korean"=85, "english"=72, "math"=90, "science"=100}
		Map<String, Integer> scoreMap = new HashMap<>();
		scoreMap.put("korean", 85);
		scoreMap.put("english", 72);
		scoreMap.put("math", 90);
		scoreMap.put("science", 100);
	%>
	
	<table border="1">
		<%
			Iterator<String> iter = scoreMap.keySet().iterator();
			while (iter.hasNext()) {
				String subject = iter.next();
		%>
				<tr>
					<th>
					<%
						if (subject.equals("korean")) {
							out.print("국어");
						} else if (subject.equals("english")) {
							out.print("영어");
						}  else if (subject.equals("math")) {
							out.print("수학");
						} else if (subject.equals("science")) {
							out.print("과학");
						} else {
							out.print(subject);
						}
					%>
					</th>
					<!-- 점수 출력 --> 
					<td><%= scoreMap.get(subject) %></td> 
				</tr>
		<%
			} // while 구간
		%>
	</table>
</body>
</html>