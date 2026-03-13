package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.BlogDao;
import com.model.BlogModel;

@WebServlet("/BlogController")
public class BlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BlogController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");

        BlogDao dao = new BlogDao();

        // DELETE BLOG
        if (action.equals("delete")) {

            int id = Integer.parseInt(request.getParameter("id"));

            dao.deleteBlog(id);

            response.sendRedirect("dashboard.jsp");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");

        BlogDao dao = new BlogDao();

        // CREATE BLOG
        if (action.equals("create")) {

            int userId = Integer.parseInt(request.getParameter("user_id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String tags = request.getParameter("tags");

            BlogModel blog = new BlogModel();

            blog.setUserId(userId);
            blog.setTitle(title);
            blog.setContent(content);
            blog.setTags(tags);

            boolean status = dao.createBlog(blog);

            if (status) {
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("createPost.jsp");
            }
        }

        // UPDATE BLOG
        if(action.equals("update")){

            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String tags = request.getParameter("tags");

            BlogModel blog = new BlogModel();

            blog.setId(id);
            blog.setTitle(title);
            blog.setContent(content);
            blog.setTags(tags);

            dao.updateBlog(blog);

            response.sendRedirect("profile.jsp");
        }
    }
	

}
