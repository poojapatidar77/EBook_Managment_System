<%-- 
    Document   : view_book
    Created on : 12 Jan, 2023, 12:49:02 AM
    Author     : 91626
--%>

<%@page import="entity.BookDtls"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="all_Component/allCss.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
    </head>
    <body style="background-color: #f0f1f2">
	<%@include file="all_Component/navbar.jsp"%>
        <%
        int id=Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
        BookDtls b=dao.getBookById(id);
        %>
        
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border  bg-white">
                    <img src="books/<%=b.getPhotoName()%>" height="200px" width="150px"><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
                    <h4>Author: <span class="text-success"><%=b.getAuthor()%></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookCategories()%></span></h4>

                </div>
                <div class="col-md-6 text-center p-5 border  bg-white">
                    <h2><%=b.getBookName()%></h2>
                    <%
                        if("Old".equals(b.getBookCategories())){%>
                        <h5 class="text-primary mt-4">Contact To Seller</h5>
                        <h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail()%></h5>
                        <%}
                        %>
                    
                    <div class="row p-2">
                        <div class="col-md-4 text-center text-danger p-2">
                        <i class="fas fa-money-bill-wave fa-2x"></i>
                        <p>Cash On Delivery</p>
                        </div>   
                        <div class="col-md-4 text-center text-danger p-2">
                     <i class="fa-solid fa-rotate-left fa-2x"></i>
                     <p>Return Available</p>
                                </div>   
                        <div class="col-md-4 text-center text-danger p-2">
                 <i class="fa-solid fa-truck fa-2x"></i>
                 <p>Free Shipping</p>
                        </div>   

                    </div>
                    <div>
                        <%
                        if("Old".equals(b.getBookCategories())){%>
                        <a href="" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a>
                        <a  class="btn btn-danger">200 <i class="fa-solid fa-indian-rupee-sign"></i></a>
                       
                        
                        <%}
else{%>
                        <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <a  class="btn btn-danger">200 <i class="fa-solid fa-indian-rupee-sign"></i></a>

<%}
                        %>
                        

                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
