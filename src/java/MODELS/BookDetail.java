package MODELS;

public class BookDetail {

    private int bookID;
    private String bookName;
    private String author;
    private String price;
    private String bookCategory;
    private String status;
    private String photoName;
    private String emailUser;

    public BookDetail() {
    }

    public BookDetail(int bookID, String bookName, String author, String price, String bookCategory, String status, String photoName, String emailUser) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.status = status;
        this.photoName = photoName;
        this.emailUser = emailUser;
    }

    public BookDetail(String bookName, String author, String price, String bookCategory, String status, String photoName, String emailUser) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.status = status;
        this.photoName = photoName;
        this.emailUser = emailUser;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
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

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
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

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    @Override
    public String toString() {
        return "BookDetail{" + "bookID=" + bookID + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", bookCategory=" + bookCategory + ", status=" + status + ", photoName=" + photoName + ", emailUser=" + emailUser + '}';
    }

}
