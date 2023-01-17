<%@page import="entity.user"%>
<%@page import="entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@include file="all_Component/allCss.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <!--  <meta charset="UTF-8"> -->

        <title>E book: Index</title>
        <style type="text/css">
            .back-img {
                background: url("img/b.jpg");
                height: 70vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .crd-ho:hover {
                background-color: #bfbfbf;
            }
        </style>


    </head>


    <body style="background-color: #ede9e8;">
        <%@include file="all_Component/navbar.jsp"%>

        <%
            user u = (user) (session.getAttribute("userobj"));
        %>

        <div class="container-fluid back-img">
            <h2 class="text-center text-black p-5">
                <i class="fas fa-book"></i> EBook Management System
            </h2>
        </div>


        <!-- start resent book -->
        <div class="container">
            <h3 class="text-center">Recent Book</h3>
            <div class="row">
                <%
                    BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list1 = dao1.getRecentBook();
                    for (BookDtls b : list1) {%>

                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="imgthumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Category : <%=b.getBookCategories()%></p>
                            <div class="row">
                                <% if (b.getBookCategories().equals("New")) {%>
                                <%
             if (u == null) {%>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-1">
                                    <i class="fa-solid fa-cart-shopping"></i>Add cart</a> 

                                <%} else {%>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1">
                                    <i class="fa-solid fa-cart-shopping"></i>Add cart</a> 

                                <%}
                                %>                                           


                                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">view Details</a> 
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fas fa-Indian-rupee-sign"></i></a>
                                    <%} else {%> 
                                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">view Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fas fa-Indian-rupee-sign"></i></a>

                                <%}%>

                            </div>
                        </div>
                    </div>
                </div>


                <%}

                %>




            </div>
            <div class="text-center mt-3">
                <a href="all_recent_books.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>
        <!-- end recent book -->

        <hr>
        <!-- start New book -->
        <div class="container">
            <h3 class="text-center">New Book</h3>
            <div class="row">

                <%                        BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list = dao.getNewBook();
                    for (BookDtls b : list) {%>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="imgthumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Category: <%=b.getBookCategories()%></p>
                            <div class="row">
                                <%
            if (u == null) {%>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-1">
                                    <i class="fa-solid fa-cart-shopping"></i>Add cart</a> 

                                <%} else {%>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1">
                                    <i class="fa-solid fa-cart-shopping"></i>Add cart</a> 

                                <%}
                                %>





                                <a href="view_book.jsp?bid=<%=b.getBookId()%>"class="btn btn-success btn-sm ml-1">view Details</a> 
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-Indian-rupee-sign"></i></a>

                            </div>
                        </div>
                    </div>
                </div>                       

                <%}
                %>




            </div>
            <div class="text-center mt-3">
                <a href="all_new_books.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>
        <!-- end New book -->
        <hr>
        <!-- start old book -->
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">

                <%
                    BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list3 = dao3.getOldBook();
                    for (BookDtls b : list3) {%>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhotoName()%>"
                                 style="width: 150px; height: 200px" class="imgthumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>Category : <%=b.getBookCategories()%></p>
                            <div class="row">
                                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">view Details</a> <a
                                    href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-Indian-rupee-sign"></i></a>

                            </div>
                        </div>
                    </div>
                </div>



                <%}
                %>


            </div>
            <div class="text-center mt-3">
                <a href="all_old_books.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>
        <!-- end old book -->

        <%@include file="all_Component/footer.jsp"%>

    </body>
</html>