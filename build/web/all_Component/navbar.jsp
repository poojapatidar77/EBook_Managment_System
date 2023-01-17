     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid" style="height:10px; background-color:#3949ab;">
</div>


<div class="container-fluid p-3 bg-light">
   <div class="row">
        <div class="col-md-3 text-success">
        <h3><i class="fas fa-book"></i> Ebook</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
         <input class="form-control mr-sm-2" type="search" name="ch"
                placeholder="Search" aria-label="Search">
           <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
   
       
       <c:if test="${not empty userobj}">
         <div class="col-md-3">
             <a href="checkout.jsp" class="text-dark  p-2">
                 <i class="fa-solid fa-cart-shopping fa-2x"></i></a>
          <a href="login.jsp" class="btn btn-success">
              <i class="fa-solid fa-user"></i> ${userobj.name}</a>
          <a href="logout" class="btn btn-primary ml-1">
              <i class="fa-solid fa-right-to-bracket"></i> Logout</a>
          
       </div>     
       </c:if>
       
       <c:if test="${empty userobj}">
          <div class="col-md-3">
          <a href="login.jsp" class="btn btn-success">
              <i class="fa-solid fa-right-to-bracket"></i> Login</a>
          <a href="register.jsp" class="btn btn-primary ml-1">
              <i class="fa-solid fa-user-plus"></i> Register</a>
          
       </div>  
       </c:if>
       
      
   
   </div>

</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link active" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_recent_books.jsp"><i class="fas fa-book-open"></i> Recent Book</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_new_books.jsp"><i class="fas fa-book-open"></i> New Book</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="all_old_books.jsp"><i class="fas fa-book-open"></i> Old Book</a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
          <i class="fa-solid fa-gear"></i> Setting</a>
      <button class="btn btn-light my-2 my-sm-0 ml-2" type="submit"><i class="fa-solid fa-phone"></i> Contact Us</button>
   
    </form>
  </div>
</nav>