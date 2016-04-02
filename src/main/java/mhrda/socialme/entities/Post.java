package mhrda.socialme.entities;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Post {
	
	private int postId;
	private User byUser;
	private User forUser;
	private String postText;
	private String postImageFileName;
	private String postImageFileNameThumb;
	private Timestamp createdTime;
	
	private Set<Comment> commentsWrittenOnPost = new HashSet<Comment>();

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public User getByUser() {
		return byUser;
	}

	public void setByUser(User byUser) {
		this.byUser = byUser;
	}

	public User getForUser() {
		return forUser;
	}

	public void setForUser(User forUser) {
		this.forUser = forUser;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public String getPostImageFileName() {
		return postImageFileName;
	}

	public void setPostImageFileName(String postImageFileName) {
		this.postImageFileName = postImageFileName;
	}

	public String getPostImageFileNameThumb() {
		return postImageFileNameThumb;
	}

	public void setPostImageFileNameThumb(String postImageFileNameThumb) {
		this.postImageFileNameThumb = postImageFileNameThumb;
	}

	public Timestamp getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}

	public Set<Comment> getCommentsWrittenOnPost() {
		return commentsWrittenOnPost;
	}

	public void setCommentsWrittenOnPost(Set<Comment> commentsWrittenOnPost) {
		this.commentsWrittenOnPost = commentsWrittenOnPost;
	}
	
}