package mhrda.socialme.dao;

import java.util.List;

import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.User;

public interface FriendshipDAO {

	List<User> getExistingFriendsOf(User user);
	
	List<Friendship> getFriendRequests(User user);

}
