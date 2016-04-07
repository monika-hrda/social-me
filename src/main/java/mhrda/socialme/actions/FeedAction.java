package mhrda.socialme.actions;

import java.util.List;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class FeedAction extends BaseAction implements UserAware {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private List<Post> feedPosts;
	
	public String showFeed() throws Exception {
		setFeedPosts(getPostDAO().getPostsForFeedOf(loggedInUser));
		return SUCCESS;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public List<Post> getFeedPosts() {
		return feedPosts;
	}

	public void setFeedPosts(List<Post> feedPosts) {
		this.feedPosts = feedPosts;
	}
	
}
