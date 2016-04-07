package mhrda.socialme.dao;

import mhrda.socialme.entities.Like;

public interface LikeDAO {
	
	int createLike(Like newLike);
	
	int deleteLike(int postId, int userId);  //the combination of postId and userId is unique for each Like
	
}
