

<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.CategoryDao"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="index.jsp"><span class="fa fa-buysellads"></span> TechBlog</a>
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
				</div>
				
				</li>
				
				<li class="nav-item"><a class="nav-link" href="login_page.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="register_page.jsp">Register</a></li>
			
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>