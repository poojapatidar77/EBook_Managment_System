
package Admin_Servlet;

import DAO.BookDAOImpl;
import DB.DBConnect;
import entity.BookDtls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/editbooks")
public class EditBooks extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
       try
       {
           int id=Integer.parseInt(req.getParameter("id"));
       String bookName=req.getParameter("bname");
     String author=req.getParameter("author");
     String price=req.getParameter("price");
     String status=req.getParameter("bstatus");
           BookDtls b=new BookDtls();
           b.setBookId(id); 
           b.setBookName(bookName);
           b.setAuthor(author);
           b.setPrice(price);
           b.setStatus(status);
           
           BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
          boolean f=dao.updateEditBooks(b);
           HttpSession session=req.getSession();
           if(f)
           {
               session.setAttribute("succMsg","Book Update Successfully");
               resp.sendRedirect("admin/all_books.jsp");
           }
           else
           {
               session.setAttribute("failedMsg","Somtheing Wrong On Server");
               resp.sendRedirect("admin/all_books.jsp");
           }
           
       }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
