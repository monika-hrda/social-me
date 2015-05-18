package mhrda.socialme.dao;

import mhrda.socialme.entities.User;

public interface UserDAO {
	
	User getUserByCredentials(String userId, String password);

}
