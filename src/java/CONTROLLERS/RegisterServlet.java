package CONTROLLERS;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import MODELS.*;
import DALS.*;
import jakarta.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        String fullName = request.getParameter("fname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String check = request.getParameter("check");
        try {
            User us = new User();
            us.setName(fullName);
            us.setEmail(email);
            us.setPhone(phone);
            us.setPassword(password);

            HttpSession sessionRegister = request.getSession();
            if (check != null) {
                UserDAOImpl dao = new UserDAOImpl();
                boolean f = dao.checkUser(email);

                if (f) {
                    boolean f2 = dao.userRegister(us);
                    if (f2) {
                        sessionRegister.setAttribute("succMsg", "Register Successfully...");
                        response.sendRedirect("VIEWS/USERS/Register.jsp");
                    } else {
                        sessionRegister.setAttribute("failMsg", "Something wrong on server...");
                        response.sendRedirect("VIEWS/USERS/Register.jsp");
                    }
                } else {
                    sessionRegister.setAttribute("failMsg", "Email already exist");
                    response.sendRedirect("VIEWS/USERS/Register.jsp");
                }

            } else {
                sessionRegister.setAttribute("failMsg", "Please check Agree & Terms...");
                response.sendRedirect("VIEWS/USERS/Register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
