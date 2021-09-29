package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techblog.dao.postDao;
import com.techblog.entities.Post;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
			
			
			
		String cid1 = request.getParameter("cid");
		int cid  = Integer.parseInt(cid1);
		String title=request.getParameter("pTitle");
		String content = request.getParameter("content");
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		user user = (user) session.getAttribute("currentUser");
		int userID = user.getId();

		
	Post p = new Post(title, content, code, cid, userID);
	postDao pd = new postDao(ConnectionProvider.getConnection());
	if(pd.addPost(p)) {
		
		pw.print("done");
	}
	else {
		pw.print(cid +" "+ title+" "+content+" "+code+" ");
		pw.print("error");
	}
		
		
		
		pw.close();
		
	}

}
