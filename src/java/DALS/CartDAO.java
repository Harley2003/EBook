package DALS;

import MODELS.*;
import java.util.*;

public interface CartDAO {

    public boolean addCart(Cart c);

    public List<Cart> getBookByUser(int userID);

    public boolean deleteBookInCart(int bid, int uid);
}
