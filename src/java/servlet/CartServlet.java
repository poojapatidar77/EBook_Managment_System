package servlet;

import DAO.BookDAOImpl;
import DAO.CartDAOImpl;
import DB.DBConnect;
import entity.BookDtls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.*;
import javax.servlet.http.HttpSession;
@WebServlet("/cart")
public class CartServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
    try{
      int bid=Integer.parseInt(req.getParameter("bid"));
      int uid=Integer.parseInt(req.getParameter("uid"));
    
        BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
        BookDtls b=dao.getBookById(bid);
        Cart c=new Cart();
        c.setBid(bid);
        c.setUid(uid);
        c.setBookName(b.getBookName());
        c.setAuthor(b.getAuthor());
        c.setPrice(Double.parseDouble(b.getPrice()));
        c.setTotal_price(Double.parseDouble(b.getPrice()));
        
        CartDAOImpl dao2=new CartDAOImpl(DBConnect.getCon());
        boolean f=dao2.addCart(c);
        HttpSession session=req.getSession();
        if(f){
        session.setAttribute("addCart","Book Added To Cart");
        resp.sendRedirect("all_new_books.jsp");
        }
        else{
        session.setAttribute("failed","Something Wrong On Server");
        resp.sendRedirect("all_new_books.jsp");

        }
;    }
   catch(Exception e){
    e.printStackTrace();
}
    }
   
}
