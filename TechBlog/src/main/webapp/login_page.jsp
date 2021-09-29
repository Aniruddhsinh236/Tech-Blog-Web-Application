<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.techblog.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


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


	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<main class="d-flex align-items-center primary-color"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">


					<div class="card">

						<div
							class="card-header primary-color text-color-light  text-center">
							<span class="fa fa-user-plus fa-2x"></span><br>
							<p1>Login here</p1>
						</div>





						<div class="card-body primary-color">
							<!-- ----------------------------------------------------form start------------------------------------ -->
							<form action="login" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										name="email" required type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email">

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="password" required type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="container text-center">
									<button type="submit"
										class="btn btn-primary primary-color mt-4">Login</button>
								</div>
							</form>
	<!-- ----------------------------------------------------form end------------------------------------ -->


						</div>

						<div class="card-footer">
							<%
							Message m = (Message) session.getAttribute("message");
							if (m != null) {
							%>


							<div class="alert alert-danger" role="<%=m.getCssclass() %>"
								style="margin: 0px padding:0px">
								<%=m.getContent()%>
							</div>
							<%
							session.removeAttribute("message");
							}
							%>


						</div>

					</div>





				</div>


			</div>

		</div>

	</main>




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
</body>
</html>