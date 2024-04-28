<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@page import="MODELS.*" %>
<%@page import="DALS.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER: CHECK OUT</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="Login.jsp"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class= "alert alert-success text-center" role= "alert">${succMsg}</div>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        <c:if test="${not empty failMsg}">
            <div class= "alert alert-danger text-center" role= "alert">${failMsg}</div>
            <c:remove var="failMsg" scope="session" />
        </c:if>


        <%
            User u = (User) session.getAttribute("userObj");                     
            CartDAOImpl dao = new CartDAOImpl();
            List<Cart> cart = (List<Cart>) dao.getBookByUser(u.getId());
        %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">

                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Selected Item</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                    Double totalPrice = 0.0;
                                    for (Cart c : cart) {
                                        totalPrice = c.getTotalPrice();
                                    
                                    %>

                                    <tr>
                                        <th scope="row"><%= c.getBookName()%></th>
                                        <td><%= c.getAuthor()%></td>
                                        <td><%= c.getPrice()%></td>
                                        <td>
                                            <a href="../../removebookcart?bid=<%= c.getBid()%>&&uid=<%= c.getUserID()%>" 
                                               class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>

                                    <%
                                        }                      
                                    %>

                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td><%= totalPrice%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>
                            <form action="<c:url value='/order' />" method="post">
                                <input type="hidden" value="<%= u.getId()%>" name="id">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Name</label>
                                        <input type="text" class="form-control" id="inputPassword4"
                                               value="<%= u.getName()%>" readonly="readonly" name="name" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Email</label>
                                        <input type="email" class="form-control" id="inputEmail4"
                                               value="<%= u.getEmail()%>" readonly="readonly" name="email" required>
                                    </div>
                                </div> 

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Mobile No</label>
                                        <input type="number" class="form-control" id="inputEmail4"
                                               value="<%= u.getPhone()%>" name="phone" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" class="form-control" id="inputPassword4" name="address" required>
                                    </div>
                                </div> 

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" class="form-control" id="inputEmail4" name="landmark" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" class="form-control" id="inputPassword4" name="city" required>
                                    </div>
                                </div> 

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">State</label>
                                        <input type="text" class="form-control" id="inputEmail4" name="state" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Zip</label>
                                        <input type="text" class="form-control" id="inputPassword4" name="zip" required>
                                    </div>
                                </div> 

                                <div class= "form-group">
                                    <label>Payment Mode</label> 
                                    <select class= "form-control" name="paymentType">
                                        <option value="noselect">--Select--</option>
                                        <option value="COD">Cash On Dlivery</option>
                                    </select>
                                </div>

                                <div class= "text-center">
                                    <button class= "btn btn-warning">Order Now</button>
                                    <a href= "Default.jsp" class= "btn btn-success ">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 350px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
