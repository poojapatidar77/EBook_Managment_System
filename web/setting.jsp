<%-- 
    Document   : setting
    Created on : 12 Jan, 2023, 10:13:56 PM
    Author     : 91626
--%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="all_Component/allCss.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
        <style>
            a{
                text-decoration: none;
                color:black;
            }
            a:hover{
                text-decoration: none;
                color:black;
                
            }
        </style>
    </head>
    <body style="background-color:#f0f1f2;">
         <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
	
	<%@include file="all_Component/navbar.jsp"%>
        <div class="container p-2">
              <h3 class="text-center mt-2">Hello ${userobj.name}</h3>  
         
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="sell_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                   <i class="fa-solid fa-book-open fa-3x"></i>
                                </div>
                                <h4>Sell Old Book</h4>
                            </div>
                        </div> 
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="oldbook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                   <i class="fa-solid fa-book-open fa-3x"></i>
                                </div>
                                <h4> Old Book</h4>
                            </div>
                        </div> 
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-pen-to-square fa-3x"></i>
                                </div>
                                <h4>Edit Profile</h4>
                            </div>
                        </div> 
                    </a>
                </div>
            
            
                
                      
       <div class="col-md-6 mt-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                     <i class="fa-solid fa-box-open fa-3x"></i>
                                </div>
                                <h4>My Order</h4>
                                <p>Trace Your Order</p>
                            </div>
                        </div> 
                    </a>
                </div>
       
                
                <div class="col-md-6 mt-3">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                     <i class="fas fa-user-circle fa-3x"></i>
                                </div>
                                <h4>Help Center</h4>
                                <p>24*7 Service</p>
                            </div>
                        </div> 
                    </a>
                </div>
       
            
            </div>
        </div>
        	<%@include file="all_Component/footer.jsp"%>

    </body>
</html>
