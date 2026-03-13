<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.dao.BlogDao" %>
<%@ page import="com.model.BlogModel" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    BlogDao dao = new BlogDao();
    BlogModel blog = dao.getBlogById(id);
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Post - SimpleBlog</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

:root {
    --primary-color: #4f46e5;
    --secondary-color: #6366f1;
    --bg-color: #f8fafc;
}

body {
    font-family: 'Inter', sans-serif;
    background-color: var(--bg-color);
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

main {
    flex: 1;
}

.form-card {
    background: #ffffff;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    padding: 2.5rem;
    border: 1px solid #f1f5f9;
}

.form-control {
    border-radius: 10px;
    padding: 0.75rem 1rem;
    background-color: #f8fafc;
    border: 1px solid #e2e8f0;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.25rem rgba(79,70,229,0.15);
    background-color: #ffffff;
}

.form-control-lg {
    font-size: 1.25rem;
    font-weight: 600;
}

.btn-primary {
    background-color: var(--primary-color);
    border-color: var(--primary-color);
    border-radius: 10px;
}

.btn-primary:hover {
    background-color: var(--secondary-color);
    border-color: var(--secondary-color);
}

.btn-danger {
    border-radius: 10px;
}

.btn-light {
    border-radius: 10px;
    background-color: #f1f5f9;
    border: none;
}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<main class="py-5">

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-lg-9">

                <div class="d-flex align-items-center mb-4">

                    <a href="profile.jsp"
                       class="text-muted text-decoration-none me-3 fs-5">

                        <i class="fa-solid fa-arrow-left"></i>

                    </a>

                    <h2 class="fw-bold m-0">Edit Post</h2>

                </div>


                <div class="form-card">

                    <form action="BlogController" method="post">

                        <input type="hidden" name="action" value="update">

                        <input type="hidden"
                               name="id"
                               value="<%= blog.getId() %>">


                        <div class="mb-4">

                            <label class="form-label text-muted small">
                                Post Title
                            </label>

                            <input type="text"
                                   class="form-control form-control-lg"
                                   name="title"
                                   value="<%= blog.getTitle() %>"
                                   required>

                        </div>


                        <div class="mb-4">

                            <label class="form-label text-muted small">
                                Tags
                            </label>

                            <div class="input-group">

                                <span class="input-group-text bg-white">
                                    <i class="fa-solid fa-tags text-muted"></i>
                                </span>

                                <input type="text"
                                       class="form-control"
                                       name="tags"
                                       value="<%= blog.getTags() %>">

                            </div>

                        </div>


                        <div class="mb-5">

                            <label class="form-label text-muted small">
                                Post Content
                            </label>

                            <textarea
                                class="form-control"
                                name="content"
                                rows="14"
                                required><%= blog.getContent() %></textarea>

                        </div>


                        <div class="d-flex justify-content-between align-items-center">

                            <a href="profile.jsp"
                               class="btn btn-light px-4">

                                Cancel

                            </a>

                            <div class="d-flex gap-2">

                                <a href="BlogController?action=delete&id=<%= blog.getId() %>"
                                   class="btn btn-danger"
                                   onclick="return confirm('Delete this post?')">

                                    <i class="fa-solid fa-trash me-2"></i>
                                    Delete

                                </a>

                                <button type="submit"
                                        class="btn btn-primary">

                                    Update Post
                                    <i class="fa-solid fa-check ms-2"></i>

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</main>

<%@ include file="footer.jsp" %>

</body>
</html>