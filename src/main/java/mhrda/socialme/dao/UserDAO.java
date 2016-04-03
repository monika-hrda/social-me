package mhrda.socialme.dao;

import java.util.List;

import mhrda.socialme.entities.User;

public interface UserDAO {
	
	User getUserByCredentials(String email, String password);
	
	User getUserById(int userId);
	
	long testUserExists(String email);
	
	int saveUser(User user);
	
	List<User> findUsers(String firstName, String lastName);
	
	void updateUser(User user);
	
//	List<User> findAll();
//    List<User> findById();
//    List<User> findByName();
//    boolean insertUser(User user);
//    boolean updateUser(User user);
//    boolean deleteUser(User user);

}
