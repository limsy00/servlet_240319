package com.test.lesson03;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/ex01")
public class Lesson03Ex01Servlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // ● response header
		response.setContentType("text/plain");
		
		// ● DB 연결
		MysqlService ms = MysqlService.getInstance();
		ms.connect(); // 실질적인 DB 연결 (★★꼭 추가)
		
		// ●insert query (DB)
		String insertQuery = "insert into `review`"
				+ "(`storeName`,`menu`,`userName`,`point`,`review`)"
				+ "values"
				+ "('화락바베큐','소금구이','임서영',4.5,'존맛')";
		
		try {
			ms.update(insertQuery);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		// ◎ 쿼리 수행 - select query (DB) => 출력
		String selectQuery = "select * from `review`";
		PrintWriter out = response.getWriter();
		try {
			ResultSet res = ms.select(selectQuery);
			while (res.next()) { // 결과행이 있는 동안 수행 ▶ res.next() := has.next()
				out.println(res.getInt("id"));
				out.println(res.getString("storeName"));
				out.println(res.getInt("point"));
				out.println(res.getString("review"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} // ◎ 쿼리 끝
		
		
		// ● DB 연결해제
		 ms.disconnect();
	}
}
