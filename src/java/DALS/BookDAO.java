package DALS;

import MODELS.*;
import java.util.*;

public interface BookDAO {

    public boolean addBooks(BookDetail b);

    public List<BookDetail> getAllBook();

    public BookDetail getBookByID(int id);

    public boolean updateEditBooks(BookDetail b);

    public boolean deleteBooks(int id);

    public List<BookDetail> getNewBook();

    public List<BookDetail> getRecentBook();

    public List<BookDetail> getOldBook();

    public List<BookDetail> getAllRecentBook();
    
    public List<BookDetail> getAllNewBook();
    
    public List<BookDetail> getAllOldBook();
    
    public List<BookDetail> getBookBySearch(String search);
}
