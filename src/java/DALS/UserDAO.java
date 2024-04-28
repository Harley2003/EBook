package DALS;

import MODELS.*;

public interface UserDAO {

    public boolean userRegister(User us);

    public User userLogin(String email, String password);
    
    public boolean checkPassword(int id, String ps);
    
    public boolean editProfile(User u);
    
    public boolean checkUser(String email);
}
