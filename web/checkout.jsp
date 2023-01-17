<%-- 
    Document   : cart
    Created on : 12 Jan, 2023, 7:06:35 PM
    Author     : 91626
--%>

<%@page import="java.util.List"%>
<%@page import="DB.DBConnect"%>
<%@page import="DAO.CartDAOImpl"%>
<%@page import="entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="all_Component/allCss.jsp"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body style="background-color: #f0f1f2;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
	<%@include file="all_Component/navbar.jsp"%>
        
        <c:if test="${not empty succMsg}">
         <div class="alert alert-success text-center" role="alert">${succMsg}</div>
            <c:remove var="succMsg" scope="session"></c:remove>
        </c:if>
        
        <c:if test="${not empty failedMsg}">
         <div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
         <c:remove var="failedMsg" scope="session"></c:remove>
        </c:if>
        
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6">
                    <div class="card">
                    <h3 class="text-center text-success">Your Selected Items</h3>

                        <div class="card-body">
                            <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
  <tbody>
  <%
  user u=(user)session.getAttribute("userobj");
  CartDAOImpl dao=new CartDAOImpl(DBConnect.getCon());
  List<Cart> cart=dao.getBookByUser(u.getId());
  double totalPrice=0;
  for(Cart c:cart )
  {
      totalPrice=c.getTotal_price(); 

%>
  <tr>
      <th scope="row"><%=c.getBookName()%></th>
      <td><%=c.getAuthor()%></td>
      <td><%=c.getPrice()%></td>
      <td>
          <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
      </td>
    </tr>

  <%}
  %>
  <tr>
      <td>Total Price</td>
      <td></td>
      <td></td>
      <td><%=totalPrice%></td>

  </tr>  
  </tbody>
</table>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>
                            <form action="order" method="post">
                                
                                <input type="hidden" name="id" value="${userobj.id}">
                                <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" name="uname" value="<%=u.getName()%>">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="<%=u.getEmail()%>">
    </div>
  </div>
                                <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone no</label>
      <input type="number" class="form-control" id="inputEmail4" name="phno" required="required" value="<%=u.getPhno()%>" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" name="address" required="required">
    </div>
  </div>
                                <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Landmark</label>
      <input type="text" class="form-control" id="inputEmail4" name="landmark" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" id="inputPassword4"required="required" name="city">
    </div>
  </div>
                                                        <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" id="inputEmail4" name="state" required="required" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">PinCode</label>
      <input type="text" class="form-control" id="inputPassword4" name="pincode" required="required">
    </div>
  </div>
                                
    <div class="form-group">
      <label for="inputState">Payment</label>
      <select id="inputState" class="form-control"name="payment" >
        <option name="noselect" selected>--Select--</option>
        <option name="COD">Cash On Delivery</option>
      </select>
    </div>                            
                
                                <div class="text-center">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>

                                </div>                   
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
