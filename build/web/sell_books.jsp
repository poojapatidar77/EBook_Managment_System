<%-- 
    Document   : sell_books
    Created on : 13 Jan, 2023, 12:04:54 AM
    Author     : 91626
--%>
<%@include file="all_Component/allCss.jsp"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Books</title>
    </head>
    <body style="background-color: #f0f1f2;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
	<%@include file="all_Component/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                        <h4 class="text-center text-primary p-1">Sell Old Book</h4>
                       
                           <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                     <c:remove var="succMsg" scope="session"></c:remove>
                         </c:if>
                        
                         
                        <c:if test="${not empty failedMsg}">
                      <p class="text-center text-danger">${failedMsg}</p>
                    <c:remove var="failedMsg" scope="session"></c:remove>
                         </c:if>  
                            
                      
                      
                 <form action="add_old_book" method="post" enctype="multipart/form-data">
                        
                 <input type="hidden" value="${userobj.email}"name="user">      
                        
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
    <label for="exampleFormControlFile1">Upload Photo</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" 
           name="bimg" required="required">
  </div>                  
        
  <button type="submit" class="btn btn-primary">  Sell  </button>
</form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
    </body>
</html>
