package mhrda.socialme.actions;

import javax.servlet.ServletContext;

import mhrda.socialme.dao.FriendshipDAO;
import mhrda.socialme.dao.FriendshipDAOImpl;
import mhrda.socialme.dao.UserDAO;
import mhrda.socialme.dao.UserDAOImpl;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	
	protected ServletContext context;
	private UserDAO userDAO;
	private FriendshipDAO friendshipDAO;
		
	public UserDAO getUserDAO() {
		if (userDAO == null) {
			SessionFactory sf = (SessionFactory) context.getAttribute("SessionFactory");
		    userDAO = new UserDAOImpl(sf);
		}
		return userDAO;
	}
	
	public FriendshipDAO getFriendshipDAO() {
		if (friendshipDAO == null) {
			SessionFactory sf = (SessionFactory) context.getAttribute("SessionFactory");
			friendshipDAO = new FriendshipDAOImpl(sf);
		}
		return friendshipDAO;
	}

	@Override
	public void setServletContext(ServletContext sc) {
		this.context = sc;
	}
	
}
