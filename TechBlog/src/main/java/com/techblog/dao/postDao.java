package com.techblog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import com.techblog.entities.Categories;
import com.techblog.entities.Post;

public class postDao {
	Connection con;

	public postDao(Connection con) {

		this.con = con;
	}

	public ArrayList<Categories> getAllCategories() {

		ArrayList<Categories> topic = new ArrayList<>();

		try {
			String q = "SELECT * FROM categories_new";
			Statement st = this.con.createStatement();
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Categories cat = new Categories(id, name, description);
				topic.add(cat);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return topic;

	}

	public boolean addPost(Post p) {
		boolean f = false;
		try {

			String q = "insert into post_new(pTitle,pContent,code,cid,userID) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getCode());

//			pstmt.setTimestamp(4,p.getpDate() );
			pstmt.setInt(4, p.getCid());
			pstmt.setInt(5, p.getUserID());

			pstmt.executeUpdate();
			
				f = true;

		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;

	}

	
	
	
	
	///for fetching all posts
	public List<Post> getAllPosts(){
		
		List<Post> list = new ArrayList<>();
		
		try {
			String q = "select * from post_new order by pId desc";
			PreparedStatement pstmt = con.prepareStatement(q);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pId =rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String code = rs.getString("code");
				Timestamp date = rs.getTimestamp("pDate");
				int cid = rs.getInt("cid");
				int userID = rs.getInt("userID");
				
				Post p = new Post(pId, pTitle, pContent, code, date, cid, userID);
				list.add(p);
			}
			
		}catch(Exception  e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

//get post by CategoryId
public List<Post> getPostById(int catId){
	List<Post> list = new ArrayList<>();
	try {
		String q = "select * from post_new where cid=?";
		PreparedStatement pstmt = con.prepareStatement(q);
		pstmt.setInt(1, catId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int pId =rs.getInt("pId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String code = rs.getString("code");
			Timestamp date = rs.getTimestamp("pDate");
			int cid = catId;
			int userID = rs.getInt("userID");
			
			Post p = new Post(pId, pTitle, pContent, code, date, cid, userID);
			list.add(p);
		}
		
	}catch(Exception  e) {
		e.printStackTrace();
	}
	return list;

}


public List<Post> getPostByPostId(int postId){
	List<Post> post = new ArrayList<>();
	
	try {
		
		String q = "select * from post_new where pId = ?";
		PreparedStatement ps = con.prepareStatement(q);
		ps.setInt(1, postId);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			int pId =rs.getInt("pId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String code = rs.getString("code");
			Timestamp date = rs.getTimestamp("pDate");
			int cid = rs.getInt("cid");
			int userID = rs.getInt("userID");
			
			Post p = new Post(pId, pTitle, pContent, code, date, cid, userID);
			post.add(p);
		}
		
		
	}catch(Exception e) {
		
		e.printStackTrace();
	}
	
	
	
	
	return post;
	
}


public List<Post> getPostByUserId(int uid){
	List<Post>post = new ArrayList<>();
	try {
		String q = "select * from post_new where userID=?";
		PreparedStatement ps = con.prepareStatement(q);
		ps.setInt(1,uid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int pId =rs.getInt("pId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String code = rs.getString("code");
			Timestamp date = rs.getTimestamp("pDate");
			int cid = rs.getInt("cid");
			int userID = rs.getInt("userID");
			
			Post p = new Post(pId, pTitle, pContent, code, date, cid, userID);
			post.add(p);
		}
		
	}catch(Exception e) {
		
		e.printStackTrace();
	}
	
	
	
	
	return post;
}




}
