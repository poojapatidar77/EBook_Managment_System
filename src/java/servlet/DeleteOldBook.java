package servlet;

import DAO.BookDAOImpl;
import DB.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   try{
   String email=req.getParameter("email");
   int id=Integer.parseInt(req.getParameter("id"));
       BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
       boolean f=dao.oldBookDelete(email,"Old",id);
       HttpSession session=req.getSession();
    if(f)
    {
    session.setAttribute("succMsg","Old Book Delete Successfully");
    resp.sendRedirect("oldbook.jsp");
    }
    else
    {
    session.setAttribute("failedMsg","Something Wrong On Server");
    resp.sendRedirect("oldbook.jsp");
    }
   }
   catch(Exception e)
   {    
       e.printStackTrace();
   }
    
    }
    
}
