
package DAO;

import entity.BookDtls;
import java.util.List;

public interface BookDAO {
    public boolean addBooks(BookDtls b);
    public List<BookDtls> getAllBooks();
    public BookDtls getBookById(int i);
    public boolean updateEditBooks(BookDtls b);
    public boolean deleteBooks(int id);
    public List<BookDtls> getNewBook();
    public List<BookDtls> getRecentBook();
     public List<BookDtls> getOldBook();
     public List<BookDtls> getAllRecentBook();
     public List<BookDtls> getAllNewBook();
     public List<BookDtls> getAllOldBook();
     public List<BookDtls> getBookByOld(String email,String cate);
     public boolean oldBookDelete(String email,String cate,int id);
    public List<BookDtls> getBookBySearch(String ch);

}
