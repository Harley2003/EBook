package DALS;

import MODELS.*;
import java.sql.*;
import java.util.*;

public class OrderBookImpl implements OrderBookDAO {

    private Connection connect;

    // Constructor để thiết lập kết nối từ DBContext
    public OrderBookImpl() {
        DBContext dbContext = new DBContext();
        this.connect = dbContext.connect;
    }

    @Override
    public boolean saveOrderBook(List<OrderBook> list) {
        boolean f = false;
        String sql = "INSERT INTO [dbo].[bookOrder]\n"
                + "           ([idOrder]\n"
                + "           ,[userName]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[bookName]\n"
                + "           ,[author]\n"
                + "           ,[price]\n"
                + "           ,[paymentType])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connect.setAutoCommit(false);
            PreparedStatement ps = connect.prepareStatement(sql);
            for (OrderBook b : list) {
                ps.setString(1, b.getIdOrder());
                ps.setString(2, b.getUserName());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getAddress());
                ps.setString(5, b.getPhone());
                ps.setString(6, b.getBookName());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPaymentType());
                ps.addBatch();
            }
            int[] count = ps.executeBatch();
            connect.commit();
            f = true;
            connect.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<OrderBook> getOrderBook(String email) {
        List<OrderBook> list = new ArrayList<>();
        OrderBook o = null;
        String sql = "select * from bookOrder where email = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new OrderBook();
                o.setId(rs.getInt(1));
                o.setIdOrder(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<OrderBook> getAllOrderBook() {
        List<OrderBook> list = new ArrayList<>();
        OrderBook o = null;
        String sql = "select * from bookOrder where email = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new OrderBook();
                o.setId(rs.getInt(1));
                o.setIdOrder(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
