package mhrda.socialme.dao;

import mhrda.socialme.entities.FriendshipStatus;

public interface FriendshipStatusDAO {
	
	FriendshipStatus getFriendshipStatusByName(String statusName);
	
}
