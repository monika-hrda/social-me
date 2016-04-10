package mhrda.socialme.actions;

import mhrda.socialme.dao.CommentDAO;
import mhrda.socialme.dao.CommentDAOImpl;
import mhrda.socialme.dao.FriendshipDAO;
import mhrda.socialme.dao.FriendshipDAOImpl;
import mhrda.socialme.dao.FriendshipStatusDAO;
import mhrda.socialme.dao.FriendshipStatusDAOImpl;
import mhrda.socialme.dao.LikeDAO;
import mhrda.socialme.dao.LikeDAOImpl;
import mhrda.socialme.dao.PaginationDAO;
import mhrda.socialme.dao.PaginationDAOImpl;
import mhrda.socialme.dao.PostDAO;
import mhrda.socialme.dao.PostDAOImpl;
import mhrda.socialme.dao.UserDAO;
import mhrda.socialme.dao.UserDAOImpl;
import mhrda.socialme.utilities.HibernateUtil;

import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private UserDAO userDAO;
	private FriendshipDAO friendshipDAO;
	private FriendshipStatusDAO friendshipStatusDAO;
	private PostDAO postDAO;
	private CommentDAO commentDAO;
	private LikeDAO likeDAO;
	private PaginationDAO paginationDAO;
	
	public UserDAO getUserDAO() {
		if (userDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
		    userDAO = new UserDAOImpl(sf);
		}
		return userDAO;
	}
	
	public FriendshipDAO getFriendshipDAO() {
		if (friendshipDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			friendshipDAO = new FriendshipDAOImpl(sf);
		}
		return friendshipDAO;
	}
	
	public FriendshipStatusDAO getFriendshipStatusDAO() {
		if (friendshipStatusDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			friendshipStatusDAO = new FriendshipStatusDAOImpl(sf);
		}
		return friendshipStatusDAO;
	}

	public PostDAO getPostDAO() {
		if (postDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			postDAO = new PostDAOImpl(sf);
		}
		return postDAO;
	}
	
	public CommentDAO getCommentDAO() {
		if (commentDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			commentDAO = new CommentDAOImpl(sf);
		}
		return commentDAO;
	}
	
	public LikeDAO getLikeDAO() {
		if (likeDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			likeDAO = new LikeDAOImpl(sf);
		}
		return likeDAO;
	}
	
	public PaginationDAO getPaginationDAO() {
		if (paginationDAO == null) {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			paginationDAO = new PaginationDAOImpl(sf);
		}
		return paginationDAO;
	}

}
