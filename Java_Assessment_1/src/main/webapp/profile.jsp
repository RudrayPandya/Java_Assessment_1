<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.BlogDao"%>
<%@ page import="com.model.BlogModel"%>
<%@ page import="com.model.CustomerModel"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Profile - SimpleBlog</title>

	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

:root{
	--primary-color:#4f46e5;
	--secondary-color:#6366f1;
	--bg-color:#f8fafc;
	--text-color:#1e293b;
}

body{
	font-family:'Inter',sans-serif;
	background-color:var(--bg-color);
	color:var(--text-color);
	display:flex;
	flex-direction:column;
	min-height:100vh;
}

main{ flex:1; }

.profile-header{
	background:#fff;
	border-radius:20px;
	box-shadow:0 4px 20px rgba(0,0,0,0.05);
	padding:3rem;
	margin-bottom:3rem;
	border:1px solid #f1f5f9;
	text-align:center;
	position:relative;
	overflow:hidden;
}

.profile-banner-color{
	position:absolute;
	top:0;
	left:0;
	right:0;
	height:120px;
	background:linear-gradient(135deg,var(--primary-color) 0%,#818cf8 100%);
	z-index:0;
}

.profile-content{
	position:relative;
	z-index:1;
	margin-top:50px;
}

.profile-avatar{
	width:120px;
	height:120px;
	border-radius:50%;
	background:#fff;
	color:var(--primary-color);
	display:inline-flex;
	align-items:center;
	justify-content:center;
	font-size:3rem;
	font-weight:800;
	border:5px solid #fff;
	box-shadow:0 4px 15px rgba(0,0,0,0.1);
	margin-bottom:1.5rem;
}

.profile-name{
	font-size:2rem;
	font-weight:800;
	color:#0f172a;
	margin-bottom:0.25rem;
}

.profile-email{
	color:#64748b;
	font-size:1.1rem;
	margin-bottom:1rem;
}

.profile-stats{
	display:flex;
	justify-content:center;
	gap:2rem;
	margin-top:1.5rem;
}

.stat-item{ text-align:center; }

.stat-value{
	font-size:1.5rem;
	font-weight:700;
	color:var(--primary-color);
}

.stat-label{
	font-size:0.85rem;
	color:#64748b;
	text-transform:uppercase;
	font-weight:600;
}

.blog-card{
	background:#fff;
	border-radius:16px;
	box-shadow:0 4px 6px -1px rgba(0,0,0,0.05);
	transition:all 0.3s ease;
	height:100%;
	display:flex;
	flex-direction:column;
}

.blog-card:hover{
	transform:translateY(-5px);
	box-shadow:0 12px 20px -5px rgba(0,0,0,0.08);
}

.blog-card-body{
	padding:1.5rem;
	display:flex;
	flex-direction:column;
}

.blog-card-title{
	font-size:1.25rem;
	font-weight:700;
	color:#0f172a;
	margin-bottom:0.75rem;
	text-decoration:none;
}

.blog-card-text{
	color:#64748b;
	font-size:0.95rem;
	margin-bottom:1.25rem;
}

.action-buttons{
	display:flex;
	gap:0.5rem;
	border-top:1px solid #f1f5f9;
	padding-top:1rem;
}

.btn-edit{
	background:#f1f5f9;
	color:#1e293b;
	border-radius:8px;
	padding:0.5rem 1rem;
	font-size:0.9rem;
	font-weight:600;
	text-decoration:none;
	flex:1;
	text-align:center;
}

.btn-delete{
	background:#fee2e2;
	color:#ef4444;
	border-radius:8px;
	padding:0.5rem 1rem;
	font-size:0.9rem;
	font-weight:600;
	text-decoration:none;
	flex:1;
	text-align:center;
}

</style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<%
	CustomerModel user = (CustomerModel)session.getAttribute("user");

	if(user == null){
		response.sendRedirect("login.jsp");
		return;
	}

	BlogDao dao = new BlogDao();
	List<BlogModel> myBlogs = dao.getBlogsByUserId(user.getId());
%>

<main class="py-5">

	<div class="container">

		<div class="row justify-content-center">

			<div class="col-lg-10">

				<!-- Profile Header -->

				<div class="profile-header">

					<div class="profile-banner-color"></div>

					<div class="profile-content">

						<div class="profile-avatar">
							<%= user.getName().substring(0,1).toUpperCase() %>
						</div>

						<h1 class="profile-name">
							<%= user.getName() %>
						</h1>

						<div class="profile-email">
							<%= user.getEmail() %>
						</div>

						<div class="profile-stats">

							<div class="stat-item">

								<div class="stat-value">
									<%= myBlogs.size() %>
								</div>

								<div class="stat-label">
									Posts
								</div>

							</div>

						</div>

					</div>

				</div>

				<!-- Blog Section -->

				<div class="d-flex justify-content-between align-items-center mb-4">

					<h3 class="fw-bold m-0" style="color:#0f172a;">
						My Blog Posts
					</h3>

					<a href="createPost.jsp" class="btn btn-sm btn-primary py-2 px-3 fw-medium" style="border-radius:8px;">
						<i class="fa-solid fa-plus me-2"></i>
						New Post
					</a>

				</div>

				<div class="row g-4">

				<%
					for(BlogModel blog : myBlogs){
				%>

					<div class="col-md-6">

						<div class="blog-card">

							<div class="blog-card-body">

								<div class="d-flex justify-content-between align-items-center mb-2">

									<span class="badge bg-light text-primary fw-medium">
										Published
									</span>

									<span class="text-muted small">
										<%= blog.getCreatedAt() %>
									</span>

								</div>

								<h4 class="blog-card-title">
									<%= blog.getTitle() %>
								</h4>

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

								<div class="action-buttons">

									<a href="editPost.jsp?id=<%=blog.getId()%>" class="btn-edit">
										<i class="fa-solid fa-pen-to-square me-1"></i>
										Edit
									</a>

									<a href="BlogController?action=delete&id=<%=blog.getId()%>"
										class="btn-delete"
										onclick="return confirm('Delete this post?')">

										<i class="fa-solid fa-trash me-1"></i>
										Delete

									</a>

								</div>

							</div>

						</div>

					</div>

				<%
					}
				%>

				</div>

			</div>

		</div>

	</div>

</main>

<%@ include file="footer.jsp" %>

</body>
</html>