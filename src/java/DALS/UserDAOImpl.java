package DALS;

import MODELS.*;
import java.sql.*;

public class UserDAOImpl implements UserDAO {

    private Connection connect;

    // Constructor để thiết lập kết nối từ DBContext
    public UserDAOImpl() {
        DBContext dbContext = new DBContext();
        this.connect = dbContext.connect;
    }

    @Override
    public boolean userRegister(User us) {
        boolean f = false;
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());

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
    public User userLogin(String email, String password) {
        User us = null;
        String sql = "select * from [User] where email = ? and [password] = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    @Override
    public boolean checkPassword(int id, String pst) {
        boolean f = false;
        String sql = "select * from [User] where id = ? and [password] = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, pst);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean editProfile(User u) {
        boolean f = false;
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhone());
            ps.setInt(4, u.getId());
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
    public boolean checkUser(String email) {
        boolean f = true;
        String sql = "select * from [User] where email = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Main Test Get Data Database
    public static void main(String[] args) {
        // Tạo một đối tượng UserDAOImpl
        UserDAOImpl userDAO = new UserDAOImpl();

        // Tạo một đối tượng User để thêm vào cơ sở dữ liệu
        User user = new User();
        user.setName("John Doe");
        user.setEmail("john@example.com");
        user.setPhone("1234567890");
        user.setPassword("password123");

        // Thực hiện đăng ký người dùng
        boolean isSuccess = userDAO.userRegister(user);

        // Kiểm tra kết quả
        if (isSuccess) {
            System.out.println("Đăng ký người dùng thành công!");
        } else {
            System.out.println("Đăng ký người dùng thất bại!");
        }
    }

}
