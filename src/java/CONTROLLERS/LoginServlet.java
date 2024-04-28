package CONTROLLERS;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import MODELS.*;
import DALS.*;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            HttpSession sessionLogin = request.getSession();
            UserDAOImpl dao = new UserDAOImpl();

            if ("admin@gmail.com".equals(email)
                    && "admin".equals(password)) {
                User us = new User();
                us.setName("Admin");
                sessionLogin.setAttribute("userObj", us);
                response.sendRedirect("VIEWS/ADMINS/Home.jsp");
            } else {
                User us = dao.userLogin(email, password);
                if (us != null) {
                    sessionLogin.setAttribute("userObj", us);
                    response.sendRedirect("VIEWS/USERS/Default.jsp");
                } else {
                    sessionLogin.setAttribute("failedMsg", "Email & Password Invalid");
                    response.sendRedirect("VIEWS/USERS/Login.jsp");
                }
                response.sendRedirect("VIEWS/USERS/Home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
