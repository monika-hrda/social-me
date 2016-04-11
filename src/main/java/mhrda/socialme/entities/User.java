package mhrda.socialme.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	
	private int userId;
	private String firstName;
	private String lastName;
	private String pwd;
	private String confirmPwd;
    private String email;
    private Date dob;
    
    private String profileImageFilename;
    private String profileImageFilenameThumb;
    
    private Set<Friendship> friendshipsWhereUserIsRequester = new HashSet<Friendship>(); //list of friendships initiated / requested by the user
    private Set<Friendship> friendshipsWhereUserIsResponder = new HashSet<Friendship>(); //list of friendships where the user is a responder
    private Set<Post> postsCreatedByUser = new HashSet<Post>();
    private Set<Post> postsCreatedForUser = new HashSet<Post>();
    private Set<Comment> commentsWrittenByUser = new HashSet<Comment>();
    private Set<Like> likesFromUser = new HashSet<Like>();
    
	public int getUserId() {
		return userId;
	}
	public void setUserId(int id) {
		this.userId = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getConfirmPwd() {
		return confirmPwd;
	}
	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getProfileImageFilename() {
		return profileImageFilename;
	}
	public void setProfileImageFilename(String profileImageFilename) {
		this.profileImageFilename = profileImageFilename;
	}
	public String getProfileImageFilenameThumb() {
		return profileImageFilenameThumb;
	}
	public void setProfileImageFilenameThumb(String profileImageFilenameThumb) {
		this.profileImageFilenameThumb = profileImageFilenameThumb;
	}
	public Set<Friendship> getFriendshipsWhereUserIsRequester() {
		return friendshipsWhereUserIsRequester;
	}
	public void setFriendshipsWhereUserIsRequester(Set<Friendship> friendshipsWhereUserIsRequester) {
		this.friendshipsWhereUserIsRequester = friendshipsWhereUserIsRequester;
	}
	public Set<Friendship> getFriendshipsWhereUserIsResponder() {
		return friendshipsWhereUserIsResponder;
	}
	public void setFriendshipsWhereUserIsResponder(Set<Friendship> friendshipsWhereUserIsResponder) {
		this.friendshipsWhereUserIsResponder = friendshipsWhereUserIsResponder;
	}
	public Set<Post> getPostsCreatedByUser() {
		return postsCreatedByUser;
	}
	public void setPostsCreatedByUser(Set<Post> postsCreatedByUser) {
		this.postsCreatedByUser = postsCreatedByUser;
	}
	public Set<Post> getPostsCreatedForUser() {
		return postsCreatedForUser;
	}
	public void setPostsCreatedForUser(Set<Post> postsCreatedForUser) {
		this.postsCreatedForUser = postsCreatedForUser;
	}
	public Set<Comment> getCommentsWrittenByUser() {
		return commentsWrittenByUser;
	}
	public void setCommentsWrittenByUser(Set<Comment> commentsWrittenByUser) {
		this.commentsWrittenByUser = commentsWrittenByUser;
	}
	public Set<Like> getLikesFromUser() {
		return likesFromUser;
	}
	public void setLikesFromUser(Set<Like> likesFromUser) {
		this.likesFromUser = likesFromUser;
	}

}
