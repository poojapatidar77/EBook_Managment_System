package servlet;

import DAO.BookOrderImpl;
import DAO.CartDAOImpl;
import DB.DBConnect;
import java.io.IOException;
import java.util.List;
import entity.*;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   
        HttpSession session=req.getSession();
        try{
            int id=Integer.parseInt(req.getParameter("id"));
            String name=req.getParameter("uname");
            String email=req.getParameter("email");
            String phno=req.getParameter("phno");
            String address=req.getParameter("address");
            String landmark=req.getParameter("landmark");
            String city=req.getParameter("city");
            String state=req.getParameter("state");
            String pincode=req.getParameter("pincode");
            String payment_type=req.getParameter("payment");
            String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
            CartDAOImpl dao=new CartDAOImpl(DBConnect.getCon());
            List<Cart> blist=dao.getBookByUser(id);
            System.out.println("state =>  ......."+state);
           if(blist.isEmpty())
           {
               session.setAttribute("failedMsg","Add Item");
                resp.sendRedirect("checkout.jsp");
           }
           else
           {
                
            BookOrderImpl dao2=new BookOrderImpl(DBConnect.getCon());
            Book_Order o=null;
            Random r=new Random();
            ArrayList<Book_Order> orderlist=new ArrayList<>();
            for(Cart c:blist)
            {
                
                o=new Book_Order();
                o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
                o.setUserName(name);
                o.setEmail(email);
                o.setPhno(phno);
                o.setFullAdd(fullAdd);
                o.setAuthor(c.getAuthor());
                o.setBookName(c.getBookName());
                o.setPrice(c.getPrice()+"");
                o.setPaymentType(payment_type);
                orderlist.add(o);
            }
            if("--Select--".equals(payment_type))
            {
                session.setAttribute("failedMsg","Choose Payment Method");
                resp.sendRedirect("checkout.jsp");
            }
            else
            {
              boolean f=dao2.saveorder(orderlist);
              if(f)
              {
                  resp.sendRedirect("order_success.jsp");
              }
              else
              {
                session.setAttribute("failedMsg","Your Order Failed");
                resp.sendRedirect("checkout.jsp");

              }
            
            }
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    
    }
    
    
}
