package org.example.danhheo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.danhheo.DAO.PostsDAO;
import org.example.danhheo.DAO.PostsDAOImpl;
import org.example.danhheo.model.Posts;

import java.io.IOException;
import java.util.List;

@WebServlet("/posts")
public class PostListServlet extends HttpServlet {
    private PostsDAO postsDAO = new PostsDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Posts> posts = postsDAO.findAll();
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/posts.jsp").forward(request, response);
    }
} 