<%-- 
    Document   : all_books
    Created on : 9 Jan, 2023, 11:06:25 PM
    Author     : 91626
--%>

<%@page import="entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="entity.user"%>
<%@page import="DB.DBConnect"%>
<%@page import="DAO.BookOrderImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : All Order</title>
                      <%@include file="allCss.jsp"%>

    </head>
    <body>
        
        <%@include file="navbar.jsp"%>
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <h3 class="text-center p-3">Hello Admin</h3>
        <table class="table table-striped">
  <thead class="bg-dark text-light">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>

    </tr>
  </thead>
  <tbody>
      <%
      user u=(user)session.getAttribute("userobj");
          BookOrderImpl dao=new BookOrderImpl(DBConnect.getCon());
   List<Book_Order> blist=dao.getAllOrder();
   for(Book_Order b:blist)
     
   {
      %>
   <tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getEmail()%></td>
      <td><%=b.getFullAdd()%></td>
      <td><%=b.getPhno()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
    </tr>
    
   
   <%}
      %>
    
        
  </tbody>
</table>
        
<div style="margin-top: 230px">
        <%@include  file="footer.jsp"%>
        </div>    </body>
</html>
