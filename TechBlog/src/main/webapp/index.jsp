
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.dao.postDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>


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
<body style="background-color:#666666">

	<!-- navbar-->
	<%@include file="navbar.jsp"%>


	<!-- banner  -->
	
	<%Connection con = ConnectionProvider.getConnection(); %>
	

	<div class="container-fluid p-0 m-0">

		<div class="jumbotron primary-color">
			<div class="container">
				<h3 class="display-3">Welcome to world of technology</h3>
				<h3 class="display-5">Everything you needs is here</h3>
				<p>
					I am your friend <strong>TechBlogger</strong>.
				</p>

				<button class="btn btn-outline-dark btn-lg">
					<span class="fa fa-user-plus"></span> Start , for free!!!
				</button>
				<a href="login_page.jsp" class="btn btn-outline-dark btn-lg">
					<span class="	fa fa-user-circle"></span> Login
				</a>
			</div>


		</div>

</div>


	<!-- cards -->
	
<div class="container">

		<div class="row mb-5 primary ">
		
<%

postDao pd = new postDao(con);
List<Post> post =pd.getAllPosts();

int i =1;
for(Post p: post){
%>

			<div class="col-md-4 mt-2 border-black">
				<div class="card">
					<div class="card-header primary-color"><%=p.getpTitle() %></div>
					<div class="card-body">
						
						<p class="card-text">Click to Read more to see full content</p>
						<button onclick="say_to_register_or_login()" class="btn btn-primary" id="readmore">Read More</button>
					</div>
				</div>
			</div>

			<%i++;
			
if(i>9)
break;

} %>

		</div>

	
	


	</div>

	












	<!-- javascript -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	<script>
	
	function say_to_register_or_login(){
		swal({
			title : "Do login or Registration first!!!",
			text : "Thank for interest",
			icon : "warning",
			
		});
	}
	</script>
	
	
	
</body>
</html>