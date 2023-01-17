<%-- 
    Document   : add_books
    Created on : 9 Jan, 2023, 11:02:59 PM
    Author     : 91626
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : Add Books</title>
              <%@include file="allCss.jsp"%>
              <%@page import="entity.*"%>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="navbar.jsp"%>
       
        <%--<c:if test="${empty userobj}">--%>
            <%--<c:redirect url="../login.jsp"></c:redirect>--%>
        <%--</c:if>--%>
        
        
        
        
        <div class="container">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                             <h4 class="text-center">Add Books</h4>
                        
                        <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                     <c:remove var="succMsg" scope="session"></c:remove>
                         </c:if>
                        
                         
                        <c:if test="${not empty failedMsg}">
                      <p class="text-center text-danger">${failedMsg}</p>
                    <c:remove var="failedMsg" scope="session"></c:remove>
                         </c:if>
                       
      <form action="../add_books" method="post" enctype="multipart/form-data">
                        
  <div class="form-group">
    <label for="exampleInputEmail1">Book Name*</label>
    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bname">
  </div>
 
    <div class="form-group">
    <label for="exampleInputEmail1">Author Name*</label>
    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="author">
  </div>
                        
   <div class="form-group">
    <label for="exampleInputEmail1">Price*</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="price">
  </div>
                        
   <div class="form-group">
      <label for="inputState">Book Categories</label>
      <select id="inputState" name="btype" class="form-control" required="required">
        <option selected>--select--</option>
        <option value="New">New Book</option>
      </select>
    </div>  
    
  
   <div class="form-group">
      <label for="inputState">Book Status</label>
      <select id="inputState" class="form-control" name="bstatus" required="required">
        <option selected>--select--</option>
        <option value="Active">Active</option>
        <option value="Inactive">Inactive</option>

      </select>
    </div>  
     
             
                        
      <div class="form-group">
    <label for="exampleFormControlFile1">Upload Photo</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" 
           name="bimg" required="required">
  </div>                  
        
  <button type="submit" class="btn btn-primary">Add</button>
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
