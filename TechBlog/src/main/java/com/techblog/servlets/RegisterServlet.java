package com.techblog.servlets;

import javax.servlet.http.*;

import com.techblog.dao.userDao;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;

import java.io.*;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");// setting the content type
		PrintWriter pw = res.getWriter();// get the stream to write the data

//writing html in the stream  
		
//fetching all data

		String check = req.getParameter("check");
		if (check == null) {
			pw.println("please agree t&c");
		} else {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String about = req.getParameter("about");
			String gender = req.getParameter("gender");

//insert data to DB

			user u = new user(name, email, password, gender, about);
			userDao dao = new userDao(ConnectionProvider.getConnection());
			if (dao.saveUser(u)) {
				pw.print("Done");
			} else {
				pw.print("something went wrong from RegisterServlet");
			}

		}

	

		pw.close();// closing the stream
	}
}