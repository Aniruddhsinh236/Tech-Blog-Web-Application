<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.postDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loading posts</title>
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
<body>
<div class="row fluid">

	<%
	postDao pd = new postDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> list = null;
	if (cid == 0) {
		list = pd.getAllPosts();
	} else {
		list = pd.getPostById(cid);
		if (list.isEmpty()) {
	%>
	<div>
		<h1>There is nothing for this category</h1>



	</div>


	<%
	}
	}
	int j = 0;
	for (Post p : list) {
	%>

	<div class="col-md-6">
		<div class="card m-1">

			<div class="card-body">
				<small><%=p.getpDate()%></small></br>
				<b><%=p.getpTitle()%> </b>





			</div>
			<div class="card-footer text-center">
					
				   <a href="readmore.jsp?post_id=<%=p.getpId()%>">Read more..</a>
				
				  
			</div>

		</div>

	</div>


	<%
	j++;
	} //for loop ends here
	%>

</div>
<br>
<small style="color: white"><b><%=j%> Results found</b></small>


</body>
</html>