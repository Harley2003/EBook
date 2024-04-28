package DALS;

import MODELS.*;
import java.sql.*;
import java.util.*;

public interface OrderBookDAO {

    public boolean saveOrderBook(List<OrderBook> list);

    public List<OrderBook> getOrderBook(String email);

    public List<OrderBook> getAllOrderBook();
}
