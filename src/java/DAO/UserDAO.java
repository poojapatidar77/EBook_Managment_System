package DAO;

//import DAO.*;
import entity.user;

public interface UserDAO {

	public boolean userRegister(user us);
        public user login(String email,String password);
       public boolean checkPassword(String p,int id);
        public boolean updateProfile(user u);
        public boolean checkUser(String em);
}
