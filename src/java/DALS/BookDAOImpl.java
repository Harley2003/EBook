package DALS;

import MODELS.*;
import java.sql.*;
import java.util.*;

public class BookDAOImpl implements BookDAO {

    private Connection connect;

    // Constructor để thiết lập kết nối từ DBContext
    public BookDAOImpl() {
        DBContext dbContext = new DBContext();
        this.connect = dbContext.connect;
    }

    @Override
    public boolean addBooks(BookDetail b) {
        boolean f = false;
        String sql = "INSERT INTO [dbo].[BookDetail]\n"
                + "           ([bookName]\n"
                + "           ,[author]\n"
                + "           ,[price]\n"
                + "           ,[bookCategory]\n"
                + "           ,[status]\n"
                + "           ,[photo]\n"
                + "           ,[emailUser])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmailUser());

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
    public List<BookDetail> getAllBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public BookDetail getBookByID(int id) {
        BookDetail b = null;
        String sql = "select * from BookDetail where bookID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean updateEditBooks(BookDetail b) {
        boolean f = false;
        String sql = "UPDATE [dbo].[BookDetail]\n"
                + "   SET [bookName] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE bookID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookID());

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
    public boolean deleteBooks(int id) {
        boolean f = false;
        String sql = "delete from BookDetail where bookID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
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
    public List<BookDetail> getNewBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where bookCategory = ? and [status] = ? order by bookID DESC";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDetail> getRecentBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where [status] = ? order by bookID DESC";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDetail> getOldBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where bookCategory = ? and [status] = ? order by bookID DESC";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDetail> getAllRecentBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where [status] = ? order by bookID DESC";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDetail> getAllNewBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where bookCategory = ? and [status] = ? order by bookID DESC";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDetail> getAllOldBook() {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where bookCategory = ? and [status] = ? order by bookID DESC";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDetail> getBookBySearch(String search) {
        List<BookDetail> list = new ArrayList<>();
        BookDetail b = null;
        String sql = "select * from BookDetail where bookName like ? "
                + "or author like ? or bookCategory like ? and [status] = ?";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setString(3, "%" + search + "%");
            ps.setString(4, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetail();
                b.setBookID(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmailUser(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
