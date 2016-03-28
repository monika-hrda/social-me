package mhrda.socialme.actions;

import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class PostAction extends BaseAction implements UserAware, ModelDriven<Post> {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private int currentProfileUserId;
	private Post post = new Post();	
	
	public String createPost() throws Exception {
		post.setByUser(loggedInUser);
		post.setForUser(getUserDAO().getUserById(currentProfileUserId));
		getPostDAO().createPost(post);
		return SUCCESS;
	}
	
	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public User getLoggedInUser() {
		return loggedInUser;
	}

	public int getCurrentProfileUserId() {
		return currentProfileUserId;
	}

	public void setCurrentProfileUserId(int currentProfileUserId) {
		this.currentProfileUserId = currentProfileUserId;
	}

	@Override
	public Post getModel() {
		return this.post;
	}
	
}
