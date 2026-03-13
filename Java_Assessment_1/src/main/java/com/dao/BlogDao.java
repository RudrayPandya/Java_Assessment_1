package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.BlogModel;
import com.util.DBUtil;

public class BlogDao {

    // CREATE BLOG
    public boolean createBlog(BlogModel blog) {

        boolean status = false;
        Connection con = null;
        try {

            con = new DBUtil().getConnectionData();

            String sql = "INSERT INTO blogs(user_id,title,content,tags) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, blog.getUserId());
            ps.setString(2, blog.getTitle());
            ps.setString(3, blog.getContent());
            ps.setString(4, blog.getTags());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // UPDATE BLOG
    public boolean updateBlog(BlogModel blog) {

        boolean status = false;
        Connection con = null;
        try {

        		con = new DBUtil().getConnectionData();

            String sql = "UPDATE blogs SET title=?, content=?, tags=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getContent());
            ps.setString(3, blog.getTags());
            ps.setInt(4, blog.getId());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // DELETE BLOG
    public boolean deleteBlog(int id) {

        boolean status = false;
        Connection con = null;
        try {

        		con = new DBUtil().getConnectionData();

            String sql = "DELETE FROM blogs WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public java.util.List<BlogModel> getAllBlogs() {

        java.util.List<BlogModel> list = new ArrayList<>();
        Connection con = null;
        try {

        		con = new DBUtil().getConnectionData();

            String sql = "SELECT * FROM blogs ORDER BY created_at DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BlogModel blog = new BlogModel();

                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setTags(rs.getString("tags"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(blog);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<BlogModel> getBlogsByUserId(int userId) {
    	
    		Connection con = null;
        List<BlogModel> list = new ArrayList<>();
        
        try {

            con = new DBUtil().getConnectionData();

            String sql = "SELECT * FROM blogs WHERE user_id=? ORDER BY created_at DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BlogModel blog = new BlogModel();

                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setTags(rs.getString("tags"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(blog);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public BlogModel getBlogById(int id){
    		
        BlogModel blog = null;
        Connection con = null;
        try{

            con = new DBUtil().getConnectionData();

            String sql = "SELECT * FROM blogs WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1,id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                blog = new BlogModel();

                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setTags(rs.getString("tags"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return blog;
    }
    
    public List<BlogModel> searchBlogs(String query, String type){
    		
    		Connection con = null;
        List<BlogModel> list = new ArrayList<>();
        
        try{

        	con = new DBUtil().getConnectionData();
            String sql="";

            if(type.equals("title")){
                sql="SELECT * FROM blogs WHERE title LIKE ?";
            }else{
                sql="SELECT * FROM blogs WHERE tags LIKE ?";
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,"%"+query+"%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                BlogModel blog = new BlogModel();

                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setTags(rs.getString("tags"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(blog);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
   
}