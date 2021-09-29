package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.techblog.entities.Categories;

public class CategoryDao {
	Connection con;

	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public List<String> getAllCategories() {
		List<String>cat = new ArrayList<>();
		try {
			String q = "select name from categories_new where id>0";
			Statement ps = con.createStatement();
			
			ResultSet rs = ps.executeQuery(q);
			while (rs.next()) {
				String name = rs.getString("name");
				cat.add(name);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cat;
	}

	
	
	

	public String getCategoryNameById(int id) {
		String cat_name = "";
		try {
			String q = "select name from categories_new where id=?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cat_name = rs.getString("name");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cat_name;
	}

	
	
	
	
}
