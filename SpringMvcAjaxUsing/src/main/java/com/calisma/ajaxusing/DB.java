package com.calisma.ajaxusing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DB {
	
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost/";
	
	private String dbName = "proje";
	private String user = "root";
	private String pass = "";
	
	private Connection conn = null;
	private Statement st = null;
	
	private String encod = "?useUnicode=true&characterEncoding=utf-8";
	
	public DB() {
	}

	public DB(String dbName) {
		this.dbName = dbName;
	}
	
	public Statement baglan() {
		try {
			// k�t�phane i�indeki �zellikleri kullanmaya ba�la
			Class.forName(driver);
			conn = DriverManager.getConnection(url+dbName+encod, user, pass);
			st = conn.createStatement();
			System.out.println("Ba�lant� Ba�ar�l�");
		} catch (Exception e) {
			System.err.println("Ba�lant� Hatas� : " + e);
		}
		return st;
	}
	
	
	// ba�lant� kapatma
	public void kapat() {
		try {
			if(st != null && conn != null) {
				st.close();
				conn.close();
				st = null;
				conn = null;
			}
		} catch (Exception e) {
			System.err.println("Kapatma Hatas� : " + e);
		}
	}
	
	

}