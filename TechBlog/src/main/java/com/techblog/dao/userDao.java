package com.techblog.dao;
import java.sql.*;

import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;
public class userDao {
	
	private Connection con;

	
	public userDao(Connection con) {
		
		this.con = con;
	}
	
	
	// method to insert user to db//for sign up purpose
	public boolean saveUser(user user) {//insert query
		
		boolean f = false;
		try {
			
		String q = "insert into user(name,email,password,gender,about)values(?,?,?,?,?)"	;
		
		PreparedStatement pstmt = this.con.prepareStatement(q);
		
		pstmt.setString(1,user.getName());
		pstmt.setString(2,user.getEmail());
		pstmt.setString(3,user.getPassword());
		pstmt.setString(4,user.getGender());
		pstmt.setString(5,user.getAbout());
			
		pstmt.executeUpdate();
			
			f = true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	
	//get user by email and id // for login purpose
	
	public user getUser(String email,String password) {
		user user=null;
		try {
		String q = "select * from user where email=? and password=?";
		PreparedStatement p = con.prepareStatement(q);
		p.setString(1, email);
		p.setString(2, password);
		
		ResultSet rs = p.executeQuery();
		
		if(rs.next()) {
			user = new user();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
			user.setAbout(rs.getString("about"));
			user.setDateTime(rs.getTimestamp("rdate"));
//			user.setProfile(rs.getString("profile"));
		}
		
		}
		catch(Exception e) {e.printStackTrace();}
		
		return user;
	}
	
	public String getUserNameById(int id) {
		String name="";
		try {
		String q = "select name from user where id=?";
		PreparedStatement ps = con.prepareStatement(q);
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			name = rs.getString("name");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return name;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
