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

public class EditBookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBookServlet at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("idEdit"));
        String bookName = request.getParameter("bname");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String status = request.getParameter("bstatus");

        BookDetail b = new BookDetail();
        b.setBookID(id);
        b.setBookName(bookName);
        b.setAuthor(author);
        b.setPrice(price);
        b.setStatus(status);

        BookDAOImpl dao = new BookDAOImpl();
        boolean f = dao.updateEditBooks(b);
        HttpSession sessionEdit = request.getSession();
        if (f) {
            sessionEdit.setAttribute("succMsg", "Book Edit Successfully");
            response.sendRedirect("VIEWS/ADMINS/AllBooks.jsp");
        } else {
            sessionEdit.setAttribute("failMsg", "Something wrong on Server");
            response.sendRedirect("VIEWS/ADMINS/AllBooks.jsp");
        }
    }

}
