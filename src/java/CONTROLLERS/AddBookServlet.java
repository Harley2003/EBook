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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class AddBookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookServlet at " + request.getContextPath() + "</h1>");
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
        String bookName = request.getParameter("bname");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String categories = request.getParameter("btype");
        String status = request.getParameter("bstatus");
        Part part = request.getPart("bimg");
        String fileName = part.getSubmittedFileName();

        try {
            BookDetail b = new BookDetail(bookName, author, price, categories, status, fileName, "admin");
            BookDAOImpl dao = new BookDAOImpl();

            HttpSession sessionAdd = request.getSession();

            boolean f = dao.addBooks(b);

            if (f) {
                String path = getServletContext().getRealPath("") + "VIEWS/IMAGES";
                File file = new File(path);
                part.write(path + File.separator + fileName);
                sessionAdd.setAttribute("succMsg", "Book Add Successfully");
                response.sendRedirect("VIEWS/ADMINS/AddBooks.jsp");
            } else {
                sessionAdd.setAttribute("failMsg", "Something wrong on Server");
                response.sendRedirect("VIEWS/ADMINS/AddBooks.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
