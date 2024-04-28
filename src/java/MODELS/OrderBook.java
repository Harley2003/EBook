package MODELS;

public class OrderBook {

    private int id;
    private String idOrder;
    private String userName;
    private String email;
    private String address;
    private String phone;
    private String bookName;
    private String author;
    private String price;
    private String paymentType;

    public OrderBook() {
    }

    public OrderBook(int id, String idOrder, String userName, String email, String address, String phone, String bookName, String author, String price, String paymentType) {
        this.id = id;
        this.idOrder = idOrder;
        this.userName = userName;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.paymentType = paymentType;
    }

    public OrderBook(String idOrder, String userName, String email, String address, String phone, String bookName, String author, String price, String paymentType) {
        this.idOrder = idOrder;
        this.userName = userName;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.paymentType = paymentType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

}
