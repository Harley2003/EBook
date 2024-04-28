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

public class EditProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileServlet at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        try {
            HttpSession sessionProfile = request.getSession();
            User us = new User();
            us.setId(id);
            us.setName(fullName);
            us.setEmail(email);
            us.setPhone(phone);

            UserDAOImpl dao = new UserDAOImpl();
            boolean f = dao.checkPassword(id, password);
            if (f) {
                boolean f2 = dao.editProfile(us);
                if (f2) {
                    sessionProfile.setAttribute("succMsg", "Profile update successfully");
                    response.sendRedirect("VIEWS/USERS/EditProfile.jsp");
                } else {
                    sessionProfile.setAttribute("failMsg", "Something wrong on server...");
                    response.sendRedirect("VIEWS/USERS/EditProfile.jsp");
                }
            } else {
                sessionProfile.setAttribute("failMsg", "Your password is incorrect");
                response.sendRedirect("VIEWS/USERS/EditProfile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
