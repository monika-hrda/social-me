package mhrda.socialme.entities;

public class Like {
	
	private int likeId;
	private Post post;
	private User likeUser;
	
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getLikeUser() {
		return likeUser;
	}
	public void setLikeUser(User likeUser) {
		this.likeUser = likeUser;
	}
	
}
