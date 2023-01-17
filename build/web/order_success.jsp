<%-- 
    Document   : order_success
    Created on : 13 Jan, 2023, 10:00:39 PM
    Author     : 91626
--%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="all_Component/allCss.jsp"%>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success</title>
    </head>
 <body style="background-color: #f0f1f2;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>	
     <%@include file="all_Component/navbar.jsp"%>
        
        <div class="conatainer text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank You</h1>
            <h2>Your Order Successfully Placed</h2>
            <h5>with in 7 Days Your Product will be Delivered In Your Address</h5>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
            <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
            
    </body>
</html>
