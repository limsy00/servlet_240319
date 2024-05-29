<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
	<!-- 1. 1부터 n까지의 합계를 구하는 함수 -->
	<%!
		// 메소드
		public int sum(int N) {
			int sum = 0;
			for (int i = 1; i <= N; i++) {
				sum += i; 
			}
			return sum;
		}
	%>
	<%= "1부터 50까지의 합은 " + sum(50) + "입니다."%><br>
	
	<!-- 2. 점수들의 평균 구하기 -->
	<%
		int[] scores = {81, 90, 100, 95, 80};
		int sum = 0;
		for (int i = 0; i < scores.length; i++) {
			sum += scores[i];
		} 
		double avg = (double)sum / scores.length;
	%>
	<%= "평균 점수는 " + avg + "입니다."%><br>
	
	<!-- 3. 채점 결과 -->
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int score = 0;
		for (int i = 0; i < scoreList.size(); i++) {
			out.print(scoreList.get(i)); // XOOOXOOOXO
			if (scoreList.get(i).equals("O")) {
				score += 100 / scoreList.size();
			}
		}
	%>
	<%= "채점 결과는 " + score + "입니다."%><br>
	
	<!-- 4. 나이 구하기 -->
	<%
		String birthDay = "20010820";
		String strYear = birthDay.substring(0, 4);
		out.println(strYear); // 2001
		int age = 2024 - Integer.parseInt(strYear);
	%>
	
	<h2>1부터 50까지의 합은 <%= sum(50) %> 입니다.</h2>
	<h2>평균 점수는 <%= avg %> 입니다.</h2>
	<h2>채점 결과는 <%= score %> 입니다.</h2>
	<h2><%= birthDay %>의 나이는 <%= age %>세 입니다.</h2>
	
	
</body>
</html>