<%-- 
    Document   : all_recent_books
    Created on : 11 Jan, 2023, 11:52:36 PM
    Author     : 91626
--%>

<%@page import="entity.user"%>
<%@page import="entity.BookDtls"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="all_Component/allCss.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Books</title>
        <style type="text/css">

            .crd-ho:hover {
                background-color: #bfbfbf;
            }
        </style>

    </head>
    <body>
        <%@include file="all_Component/navbar.jsp"%>
        
        <%
            user u = (user) (session.getAttribute("userobj"));
        %>
        <div class="container-fluid">
            <h3 class="text-center p-2">Recent Book</h3>

            <div class="row p-3">

                <%
                    String ch = request.getParameter("ch");
                    BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list1 = dao1.getBookBySearch(ch);
                    for (BookDtls b : list1) {%>

                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhotoName()%>"
                                 style="width: 100px; height: 150px" class="imgthumblin">
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




                                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">view Details</a> 
                                <a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%><i class="fas fa-Indian-rupee-sign"></i></a>
                                    <%} else {%> 
                                <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">view Details</a> 
                                <a href="" class="btn btn-danger btn-sm ml-3"><%=b.getPrice()%><i class="fas fa-Indian-rupee-sign"></i></a>

                                <%}%>

                            </div>
                        </div>
                    </div>
                </div>


                <%}

                %>


            </div>

        </div>



    </body>
</html>
