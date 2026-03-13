package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.CustomerDao;
import com.model.CustomerModel;

@WebServlet("/CustomerController")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomerController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");

	    if ("logout".equals(action)) {

	        HttpSession session = request.getSession(false);

	        if (session != null) {
	            session.invalidate();
	        }

	        response.sendRedirect("login.jsp");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String action = request.getParameter("action");

	        CustomerDao dao = new CustomerDao();

	        // REGISTER
	        if (action.equals("register")) {

	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");

	            CustomerModel customer = new CustomerModel();

	            customer.setName(name);
	            customer.setEmail(email);
	            customer.setPassword(password);

	            boolean status = dao.registerCustomer(customer);

	            if (status) {
	                response.sendRedirect("login.jsp");
	            } else {
	                response.sendRedirect("register.jsp");
	            }
	        }

	        // LOGIN
	        if (action.equals("login")) {

	            String email = request.getParameter("email");
	            String password = request.getParameter("password");

	            CustomerModel customer = dao.loginCustomer(email, password);

	            if (customer != null) {

	                HttpSession session = request.getSession();
	                session.setAttribute("user", customer);

	                response.sendRedirect("dashboard.jsp");

	            } else {

	                response.sendRedirect("login.jsp");
	            }
	        }
	    }
	

}
