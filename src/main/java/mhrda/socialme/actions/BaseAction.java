package mhrda.socialme.actions;

import mhrda.socialme.dao.FriendshipDAO;
import mhrda.socialme.dao.FriendshipDAOImpl;
import mhrda.socialme.dao.UserDAO;
import mhrda.socialme.dao.UserDAOImpl;
import mhrda.socialme.hibernate.HibernateUtil;

import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private UserDAO userDAO;
	private FriendshipDAO friendshipDAO;
		
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

}
