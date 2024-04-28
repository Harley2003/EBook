<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<!-- HEADER -->
<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-4 text-success">
            <h3>
                <i class="fas fa-book"></i>
                Ebooks
            </h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="../USERS/SearchBook.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <c:if test="${not empty userObj}">
            <div class="col-md-2">
                <a href="../USERS/CheckOut.jsp"><i class= "fas fa-cart-plus fa-2x"></i></a>
                <a href="" class="btn btn-success">
                    <i class="fas fa-user-plus"></i> ${userObj.name}</a>
                <a href="../../logout" class="btn btn-primary text-white">
                    <i class="fas fa-sign-in-alt"></i> Logout</a>
            </div>
        </c:if>

        <c:if test="${empty userObj}">
            <div class="col-md-2">
                <a href="../USERS/Login.jsp" class="btn btn-success">
                    <i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="../USERS/Register.jsp" class="btn btn-primary text-white">
                    <i class="fas fa-user-plus"></i> Register</a>
            </div>
        </c:if>
    </div>
</div>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="../USERS/Default.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="../USERS/AllRecentBook.jsp"> <i class="fas fa-book-open"></i>
                    Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="../USERS/AllNewBook.jsp"> <i class="fas fa-book-open"></i>
                    New Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link disabled" href="../USERS/AllOldBook.jsp"> <i class="fas fa-book-open"></i>
                    Old Book</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="../USERS/Setting.jsp" class="btn btn-light my-2 my-sm-0"> <i class="fas fa-cog"></i>
                Setting</a>
            <a href="../USERS/HelpLine.jsp" class="btn btn-light my-2 my-sm-0 ml-1"><i class="fas fa-phone-square-alt"></i>
                Contact Us</a>
        </form>
    </div>
</nav>