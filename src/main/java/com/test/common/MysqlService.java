package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	private static MysqlService mysqlService = null; // ※static이 붙은 순간 공용 → this._ 불가
	
	private static final String URL = "jdbc:mysql://localhost:3306/test_240319"; // ※도메인 뒤에 접속할 DB명까지 넣는다.
	private static final String ID = "root";
	private static final String PASSWORD = "root"; // ※본인이 설정한 비밀번호를 작성한다.
	
	private Connection conn;
	private Statement statement;
	private ResultSet res;
	
	// ● 객체 생성 메소드
	// Singleton 패턴 ▶ MysqlService라는 객체가 단 하나만 생성되도록 하는 디자인 패턴
	// ※이유: 여러 객체에서 DB 연결하는 것 방지
	public static MysqlService getInstance() {
        if (mysqlService == null) {
            mysqlService =  new MysqlService();
        }
        return mysqlService; 
    }
	
	// ○ DB 접속-JDBC
    public void connect() {
        try {
            // 1. 드라이버 메모리에 로딩
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());

            // 2. DB connection(연결)
            conn = DriverManager.getConnection(URL, ID, PASSWORD);

            // 3. statement ▶ DB와 쿼리를 실행하기 위한 준비
            statement = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
	// ○ DB 연결해제
    public void disconnect() {
        try { // 연결 끊기
            statement.close(); 
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
 	// ● Query 메소드
	// R / CUD
	// R - read:select
    public ResultSet select(String query) throws SQLException {
    	res = statement.executeQuery(query);
        return res;
    }
	
	// CUD:insert, update, delete
    public void update(String query) throws SQLException {
    	statement.executeUpdate(query);
    }
	
}
