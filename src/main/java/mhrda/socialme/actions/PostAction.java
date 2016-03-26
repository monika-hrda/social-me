package mhrda.socialme.actions;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class PostAction extends BaseAction implements UserAware, ModelDriven<Post> {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private int currentProfileUserId;
	private Post post = new Post();
	private List<Post> profileUserPosts;	
	
	public String createPost() throws Exception {
		post.setByUser(loggedInUser);
		post.setForUser(getUserDAO().getUserById(currentProfileUserId));
		getPostDAO().createPost(post);
		return SUCCESS;
	}
	
	public String showProfilePosts() throws Exception {
		String userId = ServletActionContext.getRequest().getParameter("userId");
		if(userId != null) {
			currentProfileUserId = Integer.parseInt(userId);
		} else {
			currentProfileUserId = loggedInUser.getUserId();
		}
		setProfileUserPosts(getPostDAO().getPostsForProfile(getUserDAO().getUserById(currentProfileUserId)));
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

	public List<Post> getProfileUserPosts() {
		return profileUserPosts;
	}

	public void setProfileUserPosts(List<Post> profileUserPosts) {
		this.profileUserPosts = profileUserPosts;
	}

}
