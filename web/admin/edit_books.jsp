<%-- 
    Document   : add_books
    Created on : 9 Jan, 2023, 11:02:59 PM
    Author     : 91626
--%>

<%@page import="DB.DBConnect"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : Edit Books</title>
              <%@include file="allCss.jsp"%>
              <%@page import="entity.*"%>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="navbar.jsp"%>
        <div class="container">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            
                            <%
                            int i=Integer.parseInt(request.getParameter("id"));
                            BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
                            BookDtls b=dao.getBookById(i);
                            %>
      <form action="../editbooks" method="post">
          <input type="hidden" name="id" value="<%=b.getBookId()%>">
          
          <h4 class="text-center">Add Books</h4>
                       
  <div class="form-group">
    <label for="exampleInputEmail1">Book Name*</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
           value="<%=b.getBookName() %>" name="bname">
  </div>
 
    <div class="form-group">
    <label for="exampleInputEmail1">Author Name*</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
           value="<%=b.getAuthor() %>" name="author">
  </div>
                        
   <div class="form-group">
    <label for="exampleInputEmail1">Price*</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
           value="<%=b.getPrice() %>" name="price">
  </div>
       
  
   <div class="form-group">
      <label for="inputState">Book Status</label>
      <select id="inputState" class="form-control" name="bstatus">
        <%
        if("Active".equals(b.getStatus())){%>
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>

      <%  }
         else
{
        %>
        <option value="Inactive">Inactive</option>
        <option value="Active">Active</option>
<% }%>
      </select>
    </div>  
       
  <button type="submit" class="btn btn-primary">Update</button>
</form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 80px">
        <%@include  file="footer.jsp"%>
        </div>

    </body>
</html>
