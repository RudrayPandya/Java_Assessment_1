package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.CustomerModel;
import com.util.DBUtil;

public class CustomerDao {

    // REGISTER CUSTOMER
    public boolean registerCustomer(CustomerModel customer) {

        boolean status = false;
        Connection con = null;
        try {

            con = new DBUtil().getConnectionData();

            String sql = "INSERT INTO users(name,email,password) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPassword());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // LOGIN CUSTOMER
    public CustomerModel loginCustomer(String email, String password) {

        CustomerModel customer = null;
        Connection con = null;
        try {

        		con = new DBUtil().getConnectionData();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                customer = new CustomerModel();

                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setPassword(rs.getString("password"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customer;
    }
 // GET CUSTOMER NAME BY ID
    public String getCustomerNameById(int id) {

        String name = null;
        Connection con = null;

        try {

            con = new DBUtil().getConnectionData();

            String sql = "SELECT name FROM users WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return name;
    }
}