package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.dao.userDao;
import com.techblog.entities.Message;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		PrintWriter pw = res.getWriter();
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		userDao userdao = new userDao(ConnectionProvider.getConnection());
		user u  = userdao.getUser(email, password);
		if(u==null) {
		
//			pw.print("invalid details try again");
			
			Message msg = new Message("Invalid! details","error","alert-danger");
			
			HttpSession s = req.getSession();
			s.setAttribute("message",msg);
			
			res.sendRedirect("login_page.jsp");
			
		}else {
			HttpSession s = req.getSession();
			s.setAttribute("currentUser", u);
			res.sendRedirect("profile.jsp");
			
			
		}
		
	}
	

}