package mhrda.socialme.actions;

import org.apache.struts2.ServletActionContext;

import mhrda.socialme.entities.Like;
import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class LikeAction extends BaseAction implements UserAware {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	
	public String createLike() throws Exception {
		
		String likePostId = ServletActionContext.getRequest().getParameter("likePostId");
		Post postToLike = getPostDAO().getPostById(Integer.parseInt(likePostId));
		
		Like newLike = new Like();
		newLike.setLikeUser(loggedInUser);
		newLike.setPost(postToLike);
		
		getLikeDAO().createLike(newLike);
		
		return SUCCESS;
	}
	
	public String deleteLike() throws Exception {
		
		int likePostId = Integer.parseInt(ServletActionContext.getRequest().getParameter("likePostId"));
		
		if (likePostId != 0) {
			getLikeDAO().deleteLike(likePostId, loggedInUser.getUserId());
		}	
		return SUCCESS;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}
	
}