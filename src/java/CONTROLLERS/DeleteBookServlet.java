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

public class DeleteBookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteBookServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        
        try {
            int id = Integer.parseInt(request.getParameter("ID"));
            BookDAOImpl dao = new BookDAOImpl();
            boolean f = dao.deleteBooks(id);
            HttpSession sessionDelete = request.getSession();
            if (f) {
                sessionDelete.setAttribute("succMsg", "Book Delete Successfully");
                response.sendRedirect("VIEWS/ADMINS/AllBooks.jsp");
            } else {
                sessionDelete.setAttribute("failMsg", "Something wrong on Server");
                response.sendRedirect("VIEWS/ADMINS/AllBooks.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
