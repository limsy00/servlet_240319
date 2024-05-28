package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz07")
public class GetMethodQuiz07 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response header setting
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
	
		// response params
		String address = request.getParameter("address");		
		String card = request.getParameter("card");		
		int price = Integer.valueOf(request.getParameter("price"));		
		
		// response 출력(분기)
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>주문 결과</title></head><body>");
		if (address.startsWith("서울시") == false) { // 서울시 포함(x) 경우: 배달 불가 지역
			out.println("배달 불가 지역입니다.");
		} else if (card.contains("신한")) { // 결제 카드-신한(X): 결제 불가
			out.println("결제 불가 카드 입니다.");
		} else {
			out.print(address + "<b> 배달 준비중</b><br>");
			out.print("결제 금액:" + price + "원");
		}
		out.print("</body></html>");
	}

}
