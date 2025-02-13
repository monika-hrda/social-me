package mhrda.socialme.actions;

import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.Comment;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;

public class CommentAction extends BaseAction implements UserAware, ModelDriven<Comment> {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private int currentPostId;
	private Comment newComment = new Comment();
	String source;

	public String createComment() throws Exception {		
		newComment.setCommentUser(loggedInUser);
		newComment.setPost(getPostDAO().getPostById(currentPostId));
		getCommentDAO().createComment(newComment);
		if (source != null && source.equals("feed")) {
			return "feed";
		}
		return SUCCESS;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	@Override
	public Comment getModel() {
		return this.newComment;
	}

	public int getCurrentPostId() {
		return currentPostId;
	}

	public void setCurrentPostId(int currentPostId) {
		this.currentPostId = currentPostId;
	}
	
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

}
