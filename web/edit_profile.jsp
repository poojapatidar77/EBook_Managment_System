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
        <title>Edit Profile</title>
    </head>
    <body style="background-color: #f0f1f2;">
	<%@include file="all_Component/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                        <h4 class="text-center text-primary p-1">Edit Profile</h4>
                       
                                       <c:if test="${not empty failedMsg}">
                                        <h5 class="text-center text-danger">${failedMsg}</h5>
                                         <c:remove var="failedMsg" scope="session"></c:remove>
                                         </c:if>
                                        
                                        <c:if test="${not empty succMsg}">
                                        <h5 class="text-center text-success">${succMsg}</h5>
                                         <c:remove var="succMsg" scope="session"></c:remove>
                                         </c:if>
                        
                        
                        
                        
                        <form action="update_profile" method="post">
                           <input type="hidden" name="id" value="${userobj.id}">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}">
							</div>

							<div class="form-group">

								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}">
							</div>
                                                        <div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

                                                        


							<button type="submit" class="btn btn-primary">Update</button>
						</form>

        
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
    </body>
</html>
