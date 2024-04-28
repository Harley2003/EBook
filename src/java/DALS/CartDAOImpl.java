package DALS;

import MODELS.*;
import java.sql.*;
import java.util.*;

public class CartDAOImpl implements CartDAO {

    private Connection connect;

    // Constructor để thiết lập kết nối từ DBContext
    public CartDAOImpl() {
        DBContext dbContext = new DBContext();
        this.connect = dbContext.connect;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([bid]\n"
                + "           ,[uid]\n"
                + "           ,[bookName]\n"
                + "           ,[author]\n"
                + "           ,[price]\n"
                + "           ,[totalPrice])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserID());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cart> getBookByUser(int userID) {
        List<Cart> list = new ArrayList<>();
        Cart c = null;
        double totalPrice = 0;
        String sql = "select * from Cart where uid = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUserID(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getDouble(6));
                totalPrice += rs.getDouble(7);
                c.setTotalPrice(totalPrice);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteBookInCart(int bid, int uid) {
        boolean f = false;
        String sql = "delete from Cart where bid = ? and uid = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
