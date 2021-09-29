package com.techblog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.entities.Message;


public class LogoutServlet2 extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		
		HttpSession session = req.getSession();
		session.removeAttribute("currentUser");
		
		Message msg = new Message("Logout Succesfully!!!", "success", "alert-success");
		
		session.setAttribute("message", msg);
		
		res.sendRedirect("login_page.jsp");
	}
}
