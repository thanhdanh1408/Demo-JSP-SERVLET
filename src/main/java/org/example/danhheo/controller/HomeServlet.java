package org.example.danhheo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.danhheo.DAO.PostsDAO;
import org.example.danhheo.DAO.PostsDAOImpl;
import org.example.danhheo.model.Posts;
import org.example.danhheo.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/*") // Xử lý tất cả request
public class HomeServlet extends HttpServlet {
    private static final int POSTS_PER_PAGE = 5;
    private PostsDAO postsDAO = new PostsDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        String path = request.getRequestURI();

        // ✅ Nếu là file tĩnh (ảnh, CSS, JS), cho phép truy cập trực tiếp
        if (path.startsWith(request.getContextPath() + "/resources/")) {
            response.sendRedirect(path);
            return;
        }

        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }

        int offset = (page - 1) * POSTS_PER_PAGE;
        List<Posts> posts = postsDAO.findAll(offset, POSTS_PER_PAGE, currentUser);

        request.setAttribute("posts", posts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", (int) Math.ceil((double) posts.size() / POSTS_PER_PAGE));

        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
