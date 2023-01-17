<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Login</title>
<%@include file="all_Component/allCss.jsp"%>

</head>
<body style="background-color:#f0f1f2;">
	<%@include file="all_Component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center">LOGIN</h3>
					
                                        <c:if test="${not empty failedMsg}">
                                        <h5 class="text-center text-danger">${failedMsg}</h5>
                                         <c:remove var="failedMsg" scope="session"></c:remove>
                                         </c:if>
                                        
                                        <c:if test="${not empty succMsg}">
                                        <h5 class="text-center text-success">${succMsg}</h5>
                                         <c:remove var="succMsg" scope="session"></c:remove>
                                         </c:if>
                                                 
                                        
                                        
                                        <form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1" name="email"
									aria-describedby="emailHelp" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="password"
									required="required">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								<br> <a href="register.jsp">Create account</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
     <br>
     <br>
     <br>
     <br>
     <br>


	<%@include file="all_Component/footer.jsp"%>

</body>
</html>