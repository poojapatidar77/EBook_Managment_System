package entity;

public class BookDtls {

private int bookId;
private String bookName;
private String author;
private String price;
private String bookCategories;
private String status;
private String photoName;
private String email;

    public BookDtls() {
    }

    public BookDtls(String bookName, String author, String price, String bookCategories, String status, String photoName, String email) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategories = bookCategories;
        this.status = status;
        this.photoName = photoName;
        this.email = email;
    }

    public BookDtls(int bookId, String bookName, String author, String price, String bookCategories, String status, String photoName, String email) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategories = bookCategories;
        this.status = status;
        this.photoName = photoName;
        this.email = email;
    }


    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookCategories() {
        return bookCategories;
    }

    public void setBookCategories(String bookCategories) {
        this.bookCategories = bookCategories;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "BookDtls{" + "bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", bookCategories=" + bookCategories + ", status=" + status + ", photoName=" + photoName + ", email=" + email + '}';
    }


}
