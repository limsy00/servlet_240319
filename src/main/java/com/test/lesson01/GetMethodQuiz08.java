package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz08")
public class GetMethodQuiz08 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
	
		String search = request.getParameter("search");
		
		List<String> list = new ArrayList<>(Arrays.asList(
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		// 탐색 출력
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>검색 결과</title></head><body>");
		
		Iterator<String> iter = list.iterator();
		while (iter.hasNext()) {
			String line = iter.next(); // 하나씩 탐색
			//System.out.println(line);
			
			// if문 - 맛집 관련 문장만 출력
			if (line.contains(search)) { 
				/* 1) replace (새로운 문자열 반환,저장) 
				 * ▶ "강남역 최고 <b>맛집</b> 소개 합니다." */
				//line = line.replace(search, "<b>" + search + "</b>");
				//out.print(line + "<br>");
				
				/* 2) split (하나의 단어만 있다는 가정하에 자르기) 
				 * ▶ words[0] = 강남역 최고, words[1] = 소개 합니다. */
				String[] words = line.split(search);
				out.print(words[0] + "<b>" + search + "</b>" + words[1] + "<br>");
			}
		}
		out.print("</body></html>");	
	}

}
