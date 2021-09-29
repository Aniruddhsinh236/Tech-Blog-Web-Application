<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>


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


	<main class="primary-color" style="padding-bottom: 80px">


		<div class="container">
			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-header text-center primary-color ">

						<span class="fa fa-user-circle fa-3x"></span><br>Register

					</div>
					<!-- card-header end here -->


					<div class="card-body primary-color">

						<!-- form start from here--------------------------------------------------------------------------->

						<form id="reg-form" action="xyz" method="post">

							<div class="form-group">
								<label for="user_name">User Name</label> <input name="name"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter username">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>


							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="male" value="male" name="gender">Male
								<input type="radio" id="female" value="female" name="gender">Female

							</div>

							<div class="form-group">

								<textarea name="about" class="form-control" rows="5"></textarea>

							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree T&C</label>
							</div>


							<button type="submit" id="submitbtn"
								class="btn btn-primary primary-color mt-4">Submit</button>


						</form>

						<!-- ------------------------------form end here------------------------------------------------------------- -->

					</div>
					<!-- card-body end here -->



					<div class="card-footer"></div>
					<!-- card-footer ends here -->



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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded...............")

			$('#reg-form').on('submit', function(event) { //click event 

				event.preventDefault(); //hold page after submit , it'll not go to the servlet
				let form = new FormData(this);

				$('#submitbtn').hide();

				//send to register_servlet using ajax

				$.ajax({
					url : "xyz",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {

						console.log(data)
						
						if(data.trim() ==='Done'){
						swal({
							title : "Registration Successful!",
							text : "Now you can do login..!",
							icon : "success",
							
						});
						}
						else{ //if user does't check t&c  
							swal({
								title : "Something went wrong!",
								text : data,
								icon : "error",
								
							});
						
							
						}
						$('#submitbtn').show();
			
						
						
						
					},
					error : function(jqXHR, textStatus, errorThrown) {

						console.log(jqXHR)
						swal ( "Oops" ,  "Something went wrong!" ,  "error" )
						$('#submitbtn').show();

					},
					processData : false,
					contentType : false
				});

			});

		});
	</script>


</body>
</html>