package DAO;

import entity.BookDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO
{
    private Connection con;

    public BookDAOImpl(Connection con) {
        this.con = con;
    }
    
    public boolean addBooks(BookDtls b)
    {
        boolean f=false;
        try
        {
            String sql="insert into book_dtls(bookName,author,price ,bookCategories,status,photo,email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,b.getBookName());
            ps.setString(2,b.getAuthor());
            ps.setString(3,b.getPrice());
            ps.setString(4,b.getBookCategories());
            ps.setString(5,b.getStatus());
            ps.setString(6,b.getPhotoName());
            ps.setString(7,b.getEmail());
      int i=ps.executeUpdate();
      if(i!=0)f=true;
     


        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    public List<BookDtls> getAllBooks()
    {
        List<BookDtls> list=new ArrayList<>();
        BookDtls b=null;
        try
        {
            String sql="select * from book_dtls";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategories(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    public BookDtls getBookById(int id)
    {
        BookDtls b=null;
        try
        {
            String sql="select * from book_dtls where bookId=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategories(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                
            }
        }
        catch(Exception e){
        e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean updateEditBooks(BookDtls b) {
    boolean f=false;
    try
    {
        String sql="update book_dtls set bookname=? ,author=?,price=?,status=? where bookId=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,b.getBookName());
        ps.setString(2,b.getAuthor());
        ps.setString(3,b.getPrice());
        ps.setString(4,b.getStatus());
        ps.setInt(5,b.getBookId());
        
        int i=ps.executeUpdate();
        if(i==1)f=true;
    }
    catch(Exception e){
    e.printStackTrace();
    }
    
    return f;
    }

    @Override
    public boolean deleteBooks(int id) {
    boolean f=false;
    try
    {
        String sql="delete from book_dtls where bookId=?";
      PreparedStatement ps=con.prepareStatement(sql);
          ps.setInt(1,id);
         int i=ps.executeUpdate();
         if(i==1)f=true;
    }
    catch(Exception e){
    e.printStackTrace();
    }    
    return f;
    }

    @Override
    public List<BookDtls> getNewBook() {
    List<BookDtls> list=new ArrayList<>();
    BookDtls b=null;
    try
    {
        String sql="select * from book_dtls where bookCategories=? and status=? order by bookId DESC";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, "New");
      ps.setString(2,"Active");
      ResultSet rs=ps.executeQuery();
      int i=1;
      while(rs.next()&& i<=4)
      {
          b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
           list.add(b);
           i++;
      }
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    
    return list;
    }

    @Override
    public List<BookDtls> getRecentBook() {
     List<BookDtls> list=new ArrayList<>();
    BookDtls b=null;
    try
    {
        String sql="select * from book_dtls where status=? order by bookId DESC";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1,"Active");
      ResultSet rs=ps.executeQuery();
      int i=1;
      while(rs.next()&& i<=4)
      {
          b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
           list.add(b);
           i++;
      }
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    
    return list;
    
    
    }

    @Override
    public List<BookDtls> getOldBook() {
    List<BookDtls> list=new ArrayList<>();
    BookDtls b=null;
    try
    {
        String sql="select * from book_dtls where bookCategories=? and status=? order by bookId DESC";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, "Old");
      ps.setString(2,"Active");
      ResultSet rs=ps.executeQuery();
      int i=1;
      while(rs.next()&& i<=4)
      {
          b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
           list.add(b);
           i++;
      }
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    
    return list;
    
    
    }

    @Override
    public List<BookDtls> getAllRecentBook() {
    List<BookDtls> list=new ArrayList<>();
    BookDtls b=null;
    try
    {
        String sql="select * from book_dtls where status=? order by bookId DESC";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1,"Active");
      ResultSet rs=ps.executeQuery();
      
      while(rs.next())
      {
          b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
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
    public List<BookDtls> getAllNewBook() {
  List<BookDtls> list=new ArrayList<>();
    BookDtls b=null;
    try
    {
        String sql="select * from book_dtls where bookCategories=? and status=? order by bookId DESC";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, "New");
      ps.setString(2,"Active");
      ResultSet rs=ps.executeQuery();
      while(rs.next())
      {
          b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
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
    public List<BookDtls> getAllOldBook() {
 List<BookDtls> list=new ArrayList<>();
    BookDtls b=null;
    try
    {
        String sql="select * from book_dtls where bookCategories=? and status=? order by bookId DESC";
      PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, "Old");
      ps.setString(2,"Active");
      ResultSet rs=ps.executeQuery();
      
      while(rs.next())
      {
          b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
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
    public List<BookDtls> getBookByOld(String email, String cate) {
     List<BookDtls> list=new ArrayList<>();
     BookDtls b=null;
     try
     {
         String sql="select * from  book_dtls where bookCategories=? and email=?";
         PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, cate);
      ps.setString(2,email);
      ResultSet rs=ps.executeQuery();
       while(rs.next())
       {
           b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
           list.add(b);
       }
     }
     catch(Exception e){
     e.printStackTrace();
     }
     
     return list;
    }

    @Override
    public boolean oldBookDelete(String email, String cate,int id) {
    boolean f=false;
    try{
        String sql="delete from book_dtls where email=? and bookCategories=? and bookId=?";
        PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1,email);
        ps.setString(2, cate);
        ps.setInt(3,id);
      int i=ps.executeUpdate();
      if(i==1)f=true;
    }
    catch(Exception e){
    e.printStackTrace();
    }
    return f;
    }

    @Override
    public List<BookDtls> getBookBySearch(String ch) {
    List<BookDtls> list=new ArrayList<>();
     BookDtls b=null;
     try
     {
         String sql="select * from  book_dtls where bookname like ? or author like ? or bookCategories like ? and status=?";
         PreparedStatement ps=con.prepareStatement(sql);
      ps.setString(1, "%"+ch+"%");
      ps.setString(2,"%"+ch+"%");
      ps.setString(3,"%"+ch+"%");
      ps.setString(4,"Active");

      ResultSet rs=ps.executeQuery();
       while(rs.next())
       {
           b=new BookDtls();
           b.setBookId(rs.getInt(1));
            b.setBookName(rs.getString(2));
           b.setAuthor(rs.getString(3));
           b.setPrice(rs.getString(4));
           b.setBookCategories(rs.getString(5));
           b.setStatus(rs.getString(6));
           b.setPhotoName(rs.getString(7));
           b.setEmail(rs.getString(8));
           list.add(b);
       }
     }
     catch(Exception e){
     e.printStackTrace();
     }
     
     return list;
    
    
    }
    
    
}
