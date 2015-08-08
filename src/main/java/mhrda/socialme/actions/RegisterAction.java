package mhrda.socialme.actions;

import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import mhrda.socialme.dao.UserDAO;
import mhrda.socialme.dao.UserDAOImpl;
import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction extends ActionSupport implements ModelDriven<User>, ServletContextAware, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();  // instantiating because of model-driven approach to action class
	private ServletContext context;
	private Map<String, Object> sessionAttributes;
	
	@Override
	public String execute() throws Exception {
		System.out.println("inside RegisterAction execute");
		
		SessionFactory sf = (SessionFactory) context.getAttribute("SessionFactory");
        UserDAO userDAO = new UserDAOImpl(sf);
        
        long numberOfExistingUsers = userDAO.testUserExists(user.getEmail());  // checks if user with the email address already exists
        
        if (numberOfExistingUsers>0) {
        	System.out.println("inside RegisterAction: found existing user");
        	return ERROR;   // add special note about email/user existing already
        } else {
        	int id = 0;
	        try {
        		id = userDAO.saveUser(getModel());
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	        if (id>0) {
	        	sessionAttributes.put("USER", user);
	    		return SUCCESS;
	        } else return ERROR;
        }
	}

	@Override
	public User getModel() {
		return this.user;
	}

	@Override
	public void setServletContext(ServletContext sc) {
		this.context = sc;
	}
	
	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = sessionAttributes;	
	}

}
