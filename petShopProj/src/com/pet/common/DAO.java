package com.pet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:petshopproj.ccdbghqtd8mv.ap-northeast-2.rds.amazonaws.com:1521:petorcl";
	private String user = "petshop";
	private String passwd = "petshop01";
	public Connection conn;
	
	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
}
