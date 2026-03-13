<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.dao.BlogDao"%>
<%@ page import="com.model.BlogModel"%>

<%
	String query = request.getParameter("query");
	String type = request.getParameter("filterByType");

	List<BlogModel> results = null;

	if(query != null && type != null){
		BlogDao dao = new BlogDao();
		results = dao.searchBlogs(query,type);
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Search - SimpleBlog</title>

	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

:root{
	--primary-color:#4f46e5;
	--secondary-color:#6366f1;
	--bg-color:#f8fafc;
}

body{
	font-family:'Inter',sans-serif;
	background-color:var(--bg-color);
	display:flex;
	flex-direction:column;
	min-height:100vh;
}

main{ flex:1; }

.search-container{
	background:#fff;
	border-radius:20px;
	padding:3rem;
	box-shadow:0 4px 20px rgba(0,0,0,0.05);
	margin-bottom:3rem;
}

.search-input{
	width:100%;
	padding:1rem 1.5rem;
	border-radius:50px;
	border:2px solid #e2e8f0;
	font-size:1.1rem;
}

.search-btn{
	background:var(--primary-color);
	border:none;
	color:white;
	padding:0.7rem 2rem;
	border-radius:50px;
}

.blog-card{
	background:#fff;
	border-radius:16px;
	box-shadow:0 4px 6px rgba(0,0,0,0.05);
	padding:1.5rem;
	height:100%;
}

.tag-badge{
	background:rgba(79,70,229,0.1);
	color:var(--primary-color);
	padding:4px 10px;
	border-radius:20px;
	font-size:12px;
	text-decoration:none;
}

.blog-card-title{
	font-size:1.2rem;
	font-weight:700;
	color:#0f172a;
	text-decoration:none;
}

.blog-card-text{
	color:#64748b;
	font-size:0.9rem;
	margin-top:8px;
}

.blog-meta{
	margin-top:15px;
	font-size:0.8rem;
	color:#94a3b8;
}

</style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<main class="py-5">

	<div class="container">

		<!-- Search Box -->

		<div class="row justify-content-center">
			<div class="col-lg-8">

				<div class="search-container text-center">

					<h2 class="fw-bold mb-4">Search Blog Posts</h2>

					<form action="search.jsp" method="get">

						<div class="input-group">

							<input
								type="text"
								class="search-input"
								name="query"
								placeholder="Search posts..."
								value="<%= query != null ? query : "" %>"
								required>

							<input type="hidden" name="filterByType" value="title">

							<button class="search-btn">Search</button>

						</div>

					</form>

				</div>

			</div>
		</div>


		<!-- Results -->

		<div class="mb-4">

			<h4 class="fw-bold">
				Search Results
				<span class="text-muted fs-6">
					Found <%= (results != null ? results.size() : 0) %> matching posts
				</span>
			</h4>

		</div>


		<div class="row g-4">

		<%
			if(results != null && results.size() > 0){

				for(BlogModel blog : results){
		%>

			<div class="col-lg-4 col-md-6">

				<div class="blog-card">

					<a href="search.jsp?query=<%=blog.getTags()%>&filterByType=tag" class="tag-badge">
						<%=blog.getTags()%>
					</a>

					<h5 class="mt-2">

						<a href="viewPost.jsp?id=<%=blog.getId()%>" class="blog-card-title">
							<%=blog.getTitle()%>
						</a>

					</h5>

					<p class="blog-card-text">

					<%
						String content = blog.getContent();

						if(content.length() > 120){
							out.print(content.substring(0,120)+"...");
						}else{
							out.print(content);
						}
					%>

					</p>

					<div class="blog-meta">
						Posted on <%=blog.getCreatedAt()%>
					</div>

				</div>

			</div>

		<%
				}

			}else{
		%>

			<div class="col-12 text-center text-muted">
				No results found.
			</div>

		<%
			}
		%>

		</div>

	</div>

</main>

<%@ include file="footer.jsp" %>

</body>
</html>