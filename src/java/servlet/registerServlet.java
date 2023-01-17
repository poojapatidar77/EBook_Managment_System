package servlet;

//import servlet.*;
import DAO.UserDAOImpl;
import DB.DBConnect;
import entity.user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;

//@WebServlet(name="register",urlPatterns={"/register"})
@WebServlet("/register")
public class registerServlet  extends HttpServlet
{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  try
			{
				String  name=req.getParameter("fname");
				String email=req.getParameter("email");
				String phno=req.getParameter("phno");
				String password=req.getParameter("password");
				String check=req.getParameter("check");

				
	    user us=new user();
	           us.setName(name);
	              us.setEmail(email);
	            us.setPassword(password);
	          us.setPhno(phno);
                  
                  HttpSession session=req.getSession();
	     if(check!=null)
             {
	      UserDAOImpl dao=new UserDAOImpl(DBConnect.getCon());
	     boolean f2=dao.checkUser(email);
              if(f2)
              {
               boolean b=dao.userRegister(us);
	      if(b)
	      {
//	      	System.out.print("successfull");
                session.setAttribute("succMsg", "Registration Successfully..");
                resp.sendRedirect("register.jsp");
	      }
	      else
	      {
//	         System.out.print("error");
                 
                session.setAttribute("failedMsg", "Somthing wrong on Server...");
                resp.sendRedirect("register.jsp");
	      }
             
              }
              else{
              session.setAttribute("failedMsg", "User Already Exist Try Another Email ID");
                resp.sendRedirect("register.jsp");
              }
              
              
             }
                  else
                  {
//                          System.out.println("please check the box");
                      
                session.setAttribute("failedMsg", "Please check Agree & Terms Condition..");
                resp.sendRedirect("register.jsp");
                    }
                        
                        }
			catch(Exception e) {
				System.out.print("welcoe");
				e.printStackTrace();
			}
	}



}
