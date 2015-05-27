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

public class LoginAction extends ActionSupport implements ModelDriven<User>, ServletContextAware, SessionAware {

	private static final long serialVersionUID = -34963371525332562L;
	
	private User user = new User();
	private ServletContext context;
	private Map<String, Object> sessionAttributes = null;

	@Override
	public String execute() throws Exception {
		System.out.println("inside LoginAction execute");
		
//		if (sessionAttributes.containsKey("USER")) {		// check if the user is already stored in the session
//			user = (User) sessionAttributes.get("USER");
//			System.out.println("User logged in: " + user.getFirstName() + ", email: " + user.getEmail());
//			return SUCCESS;		// return welcome page
//		}
		
		SessionFactory sf = (SessionFactory) context.getAttribute("SessionFactory");
        UserDAO userDAO = new UserDAOImpl(sf);
        User userDB = userDAO.getUserByCredentials(user.getEmail(), user.getPwd());
        if(userDB == null) return ERROR;
        else {
            user.setId(userDB.getId());
            user.setFirstName(userDB.getFirstName());
            user.setLastName(userDB.getLastName());
            sessionAttributes.put("USER", user);
            return SUCCESS;
        }
	}
	
	public String logout() {
		if (sessionAttributes.containsKey("USER")) {
			sessionAttributes.remove("USER");
		}
		return SUCCESS;
		
//		sessionAttributes.clear();
//		sessionAttributes.remove("USER");
//		if (sessionAttributes instanceof org.apache.struts2.dispatcher.SessionMap) {
//			try {
//				((org.apache.struts2.dispatcher.SessionMap) sessionAttributes).invalidate();
//			} catch (IllegalStateException e) { //if attempting to invalidate an already-invalid session
//				System.out.println("logout exception!: " + e);
//			}
//		}
	}

	@Override
	public User getModel() {
		return user;
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
