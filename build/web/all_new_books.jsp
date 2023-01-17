<%-- 
    Document   : all_recent_books
    Created on : 11 Jan, 2023, 11:52:36 PM
    Author     : 91626
--%>
     <%@page import="entity.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<%@page import="entity.BookDtls"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="all_Component/allCss.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Books</title>
        <style type="text/css">

.crd-ho:hover {
	background-color: #bfbfbf;
}
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

    </head>
    <body>
        <%
        user u=(user)(session.getAttribute("userobj"));
        %>
        
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart" scope="session"/>
        </c:if>
        
	<%@include file="all_Component/navbar.jsp"%>
        <div class="container-fluid">
            		<h3 class="text-center p-2">New Book</h3>

            <div class="row p-3">
   <%
                    BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
                    List<BookDtls> list=dao.getAllNewBook();
                    for(BookDtls b:list)
                    {%>
<div class="col-md-3">
<div class="card crd-ho mt-2">
<div class="card-body text-center">
    <img alt="" src="books/<%=b.getPhotoName()%>"
	style="width: 100px; height: 150px" class="imgthumblin">
	<p><%=b.getBookName()%></p>
	<p><%=b.getAuthor()%></p>
	<p>Category: <%=b.getBookCategories()%></p>
	<div class="row">
	<%
        if(u==null)
        {%>
                      <a href="login.jsp" class="btn btn-danger btn-sm ml-1">
              <i class="fa-solid fa-cart-shopping"></i>Add cart</a> 

        <%}
else{%>
<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1">
            <i class="fa-solid fa-cart-shopping"></i>Add cart</a> 

<%}
        %>
            
            
        <a href="view_book.jsp?bid=<%=b.getBookId()%>"class="btn btn-success btn-sm ml-2">view Details</a> 
        <a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> <i class="fas fa-Indian-rupee-sign"></i></a>

						</div>
					</div>
				</div>
			</div>                       
                    
                    <%}
                    %>
                                 
                      
            
            </div>

        </div>
        
        
        
    </body>
</html>
