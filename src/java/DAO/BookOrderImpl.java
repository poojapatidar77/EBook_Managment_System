/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Book_Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderImpl  implements BookOrderDAO
{
   private Connection con;

    public BookOrderImpl(Connection con) {
        this.con = con;
    }
        
    
    public boolean saveorder(List<Book_Order> list) {
    boolean f=false;
      try
      {
          String sql="insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) value(?,?,?,?,?,?,?,?,?)";
            con.setAutoCommit(false);
          PreparedStatement ps=con.prepareStatement(sql);
           for(Book_Order b:list)
           {
               ps.setString(1,b.getOrderId());
               ps.setString(2,b.getUserName());
               ps.setString(3,b.getEmail());
               ps.setString(4,b.getFullAdd());
               ps.setString(5,b.getPhno());
               ps.setString(6,b.getBookName());
               ps.setString(7,b.getAuthor());
               ps.setString(8, b.getPrice());
               ps.setString(9,b.getPaymentType());
              ps.addBatch();
           }
           int count[]=ps.executeBatch();
           con.commit();
           f=true;
           con.setAutoCommit(true);
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    
    return f;
    }

    @Override
    public List<Book_Order> getBook(String email) {
    List<Book_Order> list=new ArrayList<>();
    Book_Order b=null;
    try
    {
        String sql="select * from book_order where email=?";
                  PreparedStatement ps=con.prepareStatement(sql);
              ps.setString(1,email);
              ResultSet rs=ps.executeQuery();
              while(rs.next())
              {
                b=new Book_Order();
                b.setId(rs.getInt(1));
                b.setOrderId(rs.getString(2));
                b.setUserName(rs.getString(3));
                b.setEmail(rs.getString(4));
                b.setFullAdd(rs.getString(5));
                b.setPhno(rs.getString(6));
                b.setBookName(rs.getString(7));
                b.setAuthor(rs.getString(8));
                b.setPrice(rs.getString(9));
                b.setPaymentType(rs.getString(10));
                list.add(b);

              }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
     return list;    
    }

    @Override
    public List<Book_Order> getAllOrder() {
   List<Book_Order> list=new ArrayList<>();
    Book_Order b=null;
    try
    {
        String sql="select * from book_order";
                  PreparedStatement ps=con.prepareStatement(sql);
             
              ResultSet rs=ps.executeQuery();
              while(rs.next())
              {
                b=new Book_Order();
                b.setId(rs.getInt(1));
                b.setOrderId(rs.getString(2));
                b.setUserName(rs.getString(3));
                b.setEmail(rs.getString(4));
                b.setFullAdd(rs.getString(5));
                b.setPhno(rs.getString(6));
                b.setBookName(rs.getString(7));
                b.setAuthor(rs.getString(8));
                b.setPrice(rs.getString(9));
                b.setPaymentType(rs.getString(10));
                list.add(b);

              }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
     return list;    
    
    
    }
    

    
}
