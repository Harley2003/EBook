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
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class OrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String landMark = request.getParameter("landmark");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String paymentMode = request.getParameter("paymentType");
        String fullAdd = address + ", " + landMark + ", " + city + ", " + state + ", " + zip;
        try {
            HttpSession sessionOrder = request.getSession();
            CartDAOImpl dao = new CartDAOImpl();
            List<Cart> list = (List<Cart>) dao.getBookByUser(id);
            if (list.isEmpty() || list == null) {
                sessionOrder.setAttribute("failMsg", "Add Item");
                response.sendRedirect("VIEWS/USERS/CheckOut.jsp");
            } else {
                OrderBookImpl dao2 = new OrderBookImpl();
                Random r = new Random();
                OrderBook o = null;
                List<OrderBook> list2 = new ArrayList<>();
                for (Cart c : list) {
                    o = new OrderBook();
                    o.setIdOrder("BOOK-ORD-" + r.nextInt(1000));
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhone(phone);
                    o.setAddress(fullAdd);
                    o.setBookName(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice() + "");
                    o.setPaymentType(paymentMode);
                    list2.add(o);
                }

                if ("noselect".equals(paymentMode)) {
                    sessionOrder.setAttribute("failMsg", "Choose payment method");
                    response.sendRedirect("VIEWS/USERS/CheckOut.jsp");
                } else {
                    boolean f2 = dao2.saveOrderBook(list2);
                    if (f2) {
                        response.sendRedirect("VIEWS/USERS/OrderSuccess.jsp");
                    } else {
                        sessionOrder.setAttribute("failMsg", "Your order failed");
                        response.sendRedirect("VIEWS/USERS/CheckOut.jsp");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
