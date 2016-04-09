package mhrda.socialme.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import mhrda.socialme.entities.Friendship;
import mhrda.socialme.entities.FriendshipStatus;
import mhrda.socialme.entities.User;

public interface FriendshipDAO {

	List<User> getExistingFriendsOf(User user);
	
	List<Friendship> getFriendRequests(User user);

	int sendFriendRequest(User loggedInUser, User addFriendUser, FriendshipStatus status, Timestamp requestTime);
	
	void actionFriendRequest(int requestedFriendshipId, FriendshipStatus newStatus, Timestamp responseTime);

	Friendship getFriendshipById(int friendshipId);
	
	void deleteFriendshipById(int friendshipId);
	
	List<User> getRespondersFor(User user);
	
	Map<User, Integer> getRequestersFor(User user); //mapping Users (friendRequesters) to friendshipId
	
	Friendship getFriendshipBetweenUsers(User loggedInUser, User checkUser);

}
