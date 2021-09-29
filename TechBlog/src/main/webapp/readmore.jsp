<%@page import="com.techblog.dao.CategoryDao"%>
<%@page import="com.techblog.entities.user"%>
<%@page import="com.techblog.dao.userDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.postDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read More</title>
<!-- css -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="CSS/style.css" type="text/css" />

<!--  font awsome icon css link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">





</head>
<body style="background-color: #666666">
<%
user u = (user) session.getAttribute("currentUser");

if (u == null) {
	response.sendRedirect("login_page.jsp");
}
%>
	<!-- navbar-->


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-buysellads"></span> TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#do-post">Do post</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Java</a> <a
							class="dropdown-item" href="#">Python</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Another programing language</a>
					</div></li>

				<!-- 	<li class="nav-item"><a class="nav-link" href="register_page.jsp">Register</a></li> -->

			</ul>
			<ul class="navbar-nav mr-right">


				<li class="nav-item"><a class="nav-link text-white" href="#"><span
						class="fa fa-user-circle"><%=u.getName()%></span></a></li>



				<!-- ------------------------for logout --------------------------------------------------------- -->
				<form action="lll" method="post">
					<!-- for post request -->
					<li class="nav-item">
						<button type="submit"
							class="btn btn-primary primary-color nav-link text-white">
							<span class="fa fa-user-circle"></span>Logout
						</button>
					</li>
				</form>

				<!-- ------------------------------------------------------------------------------------------ -->



			</ul>
		</div>
	</nav>




<div class="container mt-5 mr-3 ">
<div class="row">
	<%
	int PostId = Integer.parseInt(request.getParameter("post_id"));
	postDao pd = new postDao(ConnectionProvider.getConnection());
	List<Post> post = pd.getPostByPostId(PostId);
	for (Post p : post) {
	%>


	<div class="col-md-6">
		<div class="card m-1">
			
				<div class="card-header text-center primary-color"><h3><B><%=p.getpTitle()%></B></h3></div>
				<div class="card-body">
				
				<p><%=p.getpContent()%></p><hr>
				<pre><%=p.getCode()%></pre>
				</div>
			<div class="card-footer">
			
			<%
			CategoryDao cd = new CategoryDao(ConnectionProvider.getConnection());
			String category_name =cd.getCategoryNameById(p.getCid());
			%>
				<p>Data Category: <%=category_name%></p>
				
				<%
				
				userDao ud = new userDao(ConnectionProvider.getConnection());
				String UserName = ud.getUserNameById(p.getUserID());
				
				System.out.println(UserName);
				%>
				
				<p>Contributer: <%= UserName %></p>
				<small><%=p.getpDate() %></small>
				
				</div>
			
		</div>
	</div>


	<%
	}
	%>
</div><!-- row ends here -->
</div><!-- container ends here -->
</body>
</html>