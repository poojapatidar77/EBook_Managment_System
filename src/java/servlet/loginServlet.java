
package servlet;
import DAO.*;
import entity.*;
import DAO.UserDAOImpl;
import DB.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/login")
public class loginServlet extends HttpServlet{
   @Override	
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
                throws ServletException, IOException {
            
        try
        {
            UserDAOImpl dao=new UserDAOImpl(DBConnect.getCon());
            HttpSession session=req.getSession();
            
            String email=req.getParameter("email");
            String password=req.getParameter("password");
//            System.out.println(email+"  "+password);
                    if("admin@gmail.com".equals(email) && "admin".equals(password))
                    {
                        user us=new user();
                        us.setName("Admin");
                     session.setAttribute("userobj",us);
                        resp.sendRedirect("admin/home.jsp");
                    }
                    else
                    {
                        user  us=dao.login(email,password);
                        if(us!=null)
                        {
                            session.setAttribute("userobj",us);
                        resp.sendRedirect("index.jsp");
        }
                        else
                        {
                        session.setAttribute("failedMsg","Email & Password Invalid");
                        resp.sendRedirect("login.jsp");
        
                        }
                        resp.sendRedirect("home.jsp");
                    }
                    
        }
        catch(Exception e){
        }
        
        
        
        
            }
    
}
