<%-- 
    Document   : oldbook
    Created on : 13 Jan, 2023, 2:48:42 AM
    Author     : 91626
--%>
<%@page import="entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="entity.user"%>
<%@page import="DB.DBConnect"%>
<%@page import="DAO.BookDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="all_Component/allCss.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Old Book</title>
    </head>
    <body style="background-color:#f0f1f2;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
	<%@include file="all_Component/navbar.jsp"%>
        <div class="container p-2">
            <h3 class="text-center">All Old Books</h3>
            <c:if test="${not empty succMsg}">
                <div class="alert alert-success text-center" role="alert">${succMsg}</div>
                                                 
                                                    <c:remove var="succMsg" scope="session"></c:remove>
                                                </c:if>
                                                <c:if test="${not empty failedMsg}">
                                                    <p class="text-center text-danger">${failedMsg}</p>
                                                    <c:remove var="failedMsg" scope="session"></c:remove>
                                                </c:if>
             <table class="table table-striped mt-4">
                 <thead class="bg-dark text-light">
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
      BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
      List<BookDtls> list=dao.getBookByOld(u.getEmail(),"Old");
      for(BookDtls b:list)
      {%>
       <tr>
      <th scope="row"><%=b.getBookName()%></th>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td>
          <a href="delete_old_book?email=<%=u.getEmail()%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Remove</a>
      </td>
    </tr>   
      <%}
      %>
    
    
  </tbody>
</table>
        </div>
    </body>
</html>
