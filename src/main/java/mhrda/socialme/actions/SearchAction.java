package mhrda.socialme.actions;

import java.util.List;

import javax.servlet.ServletContext;

import mhrda.socialme.dao.UserDAO;
import mhrda.socialme.dao.UserDAOImpl;
import mhrda.socialme.entities.User;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SearchAction extends ActionSupport implements ModelDriven<User>, ServletContextAware {

	private static final long serialVersionUID = 1L;
	private User user = new User();
	private ServletContext context;
	private List<User> foundUsers;

	@Override
	public String execute() throws Exception {
		System.out.println("inside SearchAction execute");
		
		SessionFactory sf = (SessionFactory) context.getAttribute("SessionFactory");
        UserDAO userDAO = new UserDAOImpl(sf);
        setFoundUsers(userDAO.findUsers(user.getFirstName(), user.getLastName()));
		return SUCCESS;
	}
	
	public List<User> getFoundUsers() {
		return foundUsers;
	}

	public void setFoundUsers(List<User> foundUsers) {
		this.foundUsers = foundUsers;
	}
	
	@Override
	public User getModel() {
		return this.user;
	}

	@Override
	public void setServletContext(ServletContext sc) {
		this.context = sc;
	}
	
}
