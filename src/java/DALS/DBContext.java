package DALS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connect;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                    + ";databaseName=" + dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, userID, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private final String serverName = "localhost";
    private final String dbName = "Ebook";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        Connection connection = dbContext.connect;
        try {
            if (connection != null && !connection.isClosed()) {
                System.out.println("Connected to the database!");
            } else {
                System.out.println("Failed to connect to the database!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
