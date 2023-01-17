<%-- 
    Document   : order
    Created on : 13 Jan, 2023, 12:35:43 AM
    Author     : 91626
--%>

<%@page import="entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="DB.DBConnect"%>
<%@page import="DAO.BookOrderImpl"%>
<%@page import="entity.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <%@include file="all_Component/allCss.jsp"%>

    </head>
    <body style="background-color: #f0f1f2;">
         	<%@include file="all_Component/navbar.jsp"%>

    
    <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
	
	 <div class="container p-1">
            <h3 class="text-center mt-3">Your Order</h3>
            <table class="table table-striped mt-4">
  <thead>
    <tr class="bg-dark text-light">
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment</th>
    </tr>
  </thead>
  <tbody>
      <%
          user u=(user)session.getAttribute("userobj");
          BookOrderImpl dao=new BookOrderImpl(DBConnect.getCon());
   List<Book_Order> blist=dao.getBook(u.getEmail());
   for(Book_Order b:blist){
      System.out.println(b);
      %>
    <tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
    </tr>
   
   <%}
%>
  </tbody>
</table>
        </div>
    </body>
</html>
