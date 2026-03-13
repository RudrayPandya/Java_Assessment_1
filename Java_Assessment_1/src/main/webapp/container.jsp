<%@page import="com.dao.CustomerDao"%>
<%@page import="com.model.CustomerModel"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.BlogDao" %>
<%@ page import="com.model.BlogModel" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SimpleBlog - Latest Posts</title>
</head>

<body>

<%
    BlogDao dao = new BlogDao();
    List<BlogModel> blogs = dao.getAllBlogs();
%>

<main class="py-5">
    <div class="container">
        <div class="row g-4">

            <!-- Main Feed -->
            <div class="col-lg-8">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="fw-bold m-0" style="color:#0f172a;">Latest Posts</h2>

                    <span class="text-muted">
                        Showing <%= blogs.size() %> posts
                    </span>
                </div>

                <div class="row g-4">

                    <%
                        for (BlogModel blog : blogs) {
                    %>

                    <div class="col-md-6">
                        <div class="blog-card">
                            <div class="blog-card-body">

                                <!-- Tag Search -->
                                <a href="search.jsp?query=<%= blog.getTags() %>&filterByType=tag" class="tag-badge">
                                    <%= blog.getTags() %>
                                </a>

                                <!-- Blog Title -->
                                <a href="viewPost.jsp?id=<%= blog.getId() %>" class="blog-card-title d-block">
                                    <%= blog.getTitle() %>
                                </a>

                                <p class="blog-card-text">

                                    <%
                                        String content = blog.getContent();

                                        if (content.length() > 120) {
                                            out.print(content.substring(0, 120) + "...");
                                        } else {
                                            out.print(content);
                                        }
                                    %>

                                </p>
								
								<%
									CustomerDao cdao = new CustomerDao();
									String username = cdao.getCustomerNameById(blog.getUserId());
									%>
								
                                <div class="blog-meta">

                                    <div class="author-info">
									
									    <div class="author-avatar">
									        <%= username.substring(0,1).toUpperCase() %>
									    </div>
									
									    <div>
									
									        <div><%= username %></div>
									
									        <div class="text-muted" style="font-size:0.75rem;">
									            <%= blog.getCreatedAt() %>
									        </div>
									
									    </div>
									
									</div>
	
                                    <a href="viewPost.jsp?id=<%= blog.getId() %>" class="read-more-btn">
                                        Read <i class="fa-solid fa-arrow-right"></i>
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


            <!-- Right Sidebar -->
            <div class="col-lg-4">

                <!-- Search -->
                <div class="sidebar-widget">

                    <h4 class="widget-title">Search</h4>

                    <form action="search.jsp" method="get">

                        <input type="hidden" name="filterByType" value="title">

                        <div class="input-group">

                            <input type="text"
                                   class="form-control"
                                   name="query"
                                   placeholder="Search blog by title..."
                                   required>

                            <button class="btn btn-primary px-3" type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                        </div>

                    </form>

                </div>


                <!-- Recent Posts -->
                <div class="sidebar-widget">

                    <h4 class="widget-title">Recent Posts</h4>

                    <div class="recent-posts">

                        <%
                            for (int i = 0; i < blogs.size() && i < 3; i++) {

                                BlogModel b = blogs.get(i);
                        %>

                        <div class="recent-post-item">

                            <div>

                                <a href="viewPost.jsp?id=<%= b.getId() %>" class="recent-title">
                                    <%= b.getTitle() %>
                                </a>

                                <span class="recent-date">
                                    <%= b.getCreatedAt() %>
                                </span>

                            </div>

                        </div>

                        <%
                            }
                        %>

                    </div>

                </div>


                <!-- Tags -->
                <div class="sidebar-widget">

                    <h4 class="widget-title">Popular Tags</h4>

                    <div class="tag-cloud">

                        <%
                            for (BlogModel blog : blogs) {
                        %>

                        <a href="search.jsp?query=<%= blog.getTags() %>&filterByType=tag">
                            <%= blog.getTags() %>
                        </a>

                        <%
                            }
                        %>

                    </div>

                </div>

            </div>

        </div>
    </div>
</main>

</body>
</html>