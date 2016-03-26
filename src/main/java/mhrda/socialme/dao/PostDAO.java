package mhrda.socialme.dao;

import java.util.List;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;

public interface PostDAO {
	
	int createPost(Post newPost);
	
	List<Post> getPostsForProfile(User profileUser);
	
}
