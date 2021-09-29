
<%@page import="java.util.List"%>
<%@page import="com.techblog.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp"%>

<%@page import="com.techblog.entities.user"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.postDao"%>
<%@page import="com.techblog.entities.Categories"%>

<%
user u = (user) session.getAttribute("currentUser");

if (u == null) {
	response.sendRedirect("login_page.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

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
						<%CategoryDao cd = new CategoryDao(ConnectionProvider.getConnection());
			List<String>cat_name = cd.getAllCategories();
			for(String s : cat_name){
			%>
					<a class="dropdown-item" href="#"><%=s%></a>
					<%}  %> 
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

<!-- categories in profile body-->
	<main>
		<div class="container">
			<div class="row">

				<div class="col-md-4 ">
						<div class="list-group mt-3">
  									<a href="#" onclick="getPost(0,this)"  class=" c-link list-group-item primary-color text-contrast " style="text-decoration:none">All Categories</a>
										<a href="#" onclick="getPostofParticularUser(<%=u.getId() %>,this)"  class=" c-link list-group-item list-group-item-dark  primary-color text-white" style="text-decoration:none">My Posts</a>
									
									<% postDao cat = new postDao(ConnectionProvider.getConnection()) ;
 										ArrayList<Categories>cats = cat.getAllCategories();

										for(Categories c:cats){
									%>
										<a href="#" onclick="getPost(<%=c.getId() %>,this)" style="text-decoration:none" class=" c-link list-group-item list-group-item-dark  primary-color text-white"><%=c.getName() %></a>
 									<%} %>
						
</div>

				</div><!-- column1 ends here -->
			<div class="col-md-8" >
				<!-- posts -->
				<div class="container text-center" id="loader">
							<i class="fa fa-refresh fa-4x fa-spin"></i>
							<h3 class="mt-2">Loading...</h3>
				</div>
				<div class="container text-fluid mt-4" id="post-container">
							
				</div>
						
				
			</div>
				<!-- column2 ends here -->
			</div>
			<!-- row ends here -->


		</div>
		<!-- container ends here -->



	</main>

<!-- categories in profile body ends here -->



	<!------------------------------------------- post modal starts here  --------------------------------------------------->

	<!-- Modal -->
	<div class="modal fade" id="do-post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Contribute here</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- -------------------------------------------------post form starts here-------------------------- -->
					<form id="post-form" action="AddPostServlet" method="post">

						<div class="form-group">

							<select class="form-control" name="cid">

								<option disabled="disabled" selected="selected">---select
									one category---</option>


								<%
								postDao pd = new postDao(ConnectionProvider.getConnection());
								ArrayList<Categories> list = pd.getAllCategories();
								for (Categories c : list) {
								%>

								<option value="<%=c.getId()%>">
									<%=c.getName()%>
								</option>

								<%
								}
								%>

							</select>


						</div>


						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter title here"
								class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="content" class="form-control"
								style="height: 200px" placeholder="Enter content here"></textarea>
						</div>
						<div class="form-group">
							<textarea name="code" class="form-control" style="height: 200px"
								placeholder="Enter your code here (optional)"></textarea>
							</br>

							<div class="form-group container text-center">
								<button type="submit" class="btn-lg primary-color text-white">POST</button>

							</div>
					</form>
					<!------- -----------------------------------post  form ends here-------------------------- -->

				</div>




			</div>
		</div>
	</div>
	<!----------------------------------------  post modal ends here ----------------------------------------------------->



	



	<!----------------------------------------------- javascript------------------------------------ -->

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
	<!----------------------------------------------- javascript ends here------------------------------------ -->






	<!-----------------now add post to the database usig ajax call profile.jsp------------------------------------  -->
	<script>
		$(document)
				.ready(
						function() {
							$("#post-form").on("submit",function(event) {
												//this function will call when user submit the form

												event.preventDefault();
												console
														.log("submitted=======================")
												let form = new FormData(this);

												///now requesting to servlet

												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																console
																		.log(data)
																if (data.trim() === 'done') {
																	swal({
																		title : "Posted Successful!",
																		text : "Thanks for Contribution!!! keep it up",
																		icon : "success",

																	});
																} else {
																	swal({
																		title : "sorry...something went wrong from server side!!!",
																		text : data,
																		icon : "error",

																	});

																}

															},//ajax success ends here
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {

																swal({
																	title : "s w r in profile post!",
																	text : "Thanks for visiting!!!",
																	icon : "error",

																});
															},//ajax error ends here
															processData : false,
															contentType : false

														})

											})

						})
	</script>

<!-- loading posts ajax call starts here -->

<script>

function getPost(catId,temp){        //temp is reference of the category
	$(".c-link").removeClass('primary-color')    //here i have remove the class name "primary-color"
	
	$.ajax({
		url:"load_posts.jsp",
		data:{cid:catId},
		success: function(data , textStatus ,jqXHR){
			
			console.log(data);
			$("#loader").hide();
			$("#post-container").html(data);
			$(temp).addClass('primary-color');
			
		}
		
		
	})
}
function getPostofParticularUser(userId,temp){        //temp is reference of the category
	$(".c-link").removeClass('primary-color')    //here i have remove the class name "primary-color"
	console.log(userId)
	$.ajax({
		url:"load_post_of_particular_user.jsp",
		data:{userID:userId},
		success: function(data , textStatus ,jqXHR){
			
			console.log(data);
			$("#loader").hide();
			$("#post-container").html(data);
			$(temp).addClass('primary-color');
			
		}
		
		
	})
}

$(document).ready(function(e){
	let allPostLable = $('.c-link')[0] ///first button reference of profile body , here is ALL POST
	getPost(0,allPostLable)
	
	
	
})




</script>



<!-- loading posts ajax call ends here -->

	<!-----------------ajax call ends here profile.jsp------------------------------------------------------------------  -->
</body>
</html>