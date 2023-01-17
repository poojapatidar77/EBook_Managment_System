package servlet;

import DAO.BookDAOImpl;
import DB.DBConnect;
import entity.BookDtls;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet
{
  @Override
public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException
{
 try
 {
     String bookName=req.getParameter("bname");
     String author=req.getParameter("author");
     String price=req.getParameter("price");
     String category="Old";
     String status="Active";
     Part part=req.getPart("bimg");
     String fileName=part.getSubmittedFileName();
      String useremail=req.getParameter("user");
     BookDtls b=new BookDtls(bookName,author,price,category,status,fileName,useremail);
 BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());

  boolean f= dao.addBooks(b);
          
     HttpSession session=req.getSession();
     if(f)
     {
 String path=getServletContext().getRealPath("")+File.separator+"books"; 
      File f1=new File(path);
//      part.write(fileName);

//String s="C:\\Users\\91626\\AppData\\Roaming\\NetBeans\\8.2\\config\\GF_4.1.1\\domain1\\generated\\jsp\\EBook\\"+fileName;
//    
//    try(InputStream in = new FileInputStream(s)){
//            System.out.println("in  => "+in);
//
//          Files.copy(in, Paths.get(path+File.separator+fileName));
//}
//      
     
         session.setAttribute("succMsg","Book add Successfully");
         resp.sendRedirect("sell_books.jsp");
     }
     else
     {
        session.setAttribute("failedMsg","Somthering wrong on Server");
         resp.sendRedirect("sell_books.jsp");
     }
 }
 catch(Exception e){
   e.printStackTrace();
}
    
}  
}
