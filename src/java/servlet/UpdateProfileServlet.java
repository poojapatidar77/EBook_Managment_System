/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.UserDAOImpl;
import DB.DBConnect;
import entity.user;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 91626
 */
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {

        try
        {
        String  name=req.getParameter("fname");
		String email=req.getParameter("email");
	String phno=req.getParameter("phno");
       String password=req.getParameter("password");
        int id=Integer.parseInt(req.getParameter("id"));
         UserDAOImpl dao=new UserDAOImpl(DBConnect.getCon());
	 user us=new user();
         us.setId(id);
         us.setName(name);
         us.setEmail(email);
         us.setPhno(phno);
                           HttpSession session=req.getSession();

         boolean f=dao.checkPassword(password,id);
              if(f)
              {
                  boolean f2=dao.updateProfile(us);
                   if(f2){
                       session.setAttribute("succMsg", "Profile Update Successfully..");
                        resp.sendRedirect("edit_profile.jsp");
                   }
                   else
                   {
                       session.setAttribute("failedMsg", "Somtheing Wrong On Server");
                resp.sendRedirect("edit_profile.jsp");
                   }
              }
              else
              {
                  session.setAttribute("failedMsg", "Password is Incorrect");
                resp.sendRedirect("edit_profile.jsp");
              }
        }
    
    catch(Exception e)
    {
        e.printStackTrace();
    }
    }
}
