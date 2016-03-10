package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction extends BaseAction implements ModelDriven<User>, SessionAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();  // instantiating because of model-driven approach to action class
	private Map<String, Object> sessionAttributes;
	
	@Override
	public String execute() throws Exception {
		System.out.println("inside RegisterAction execute");
 
        long numberOfExistingUsers = getUserDAO().testUserExists(user.getEmail());  // checks if user with the email address already exists
        
        if (numberOfExistingUsers>0) {
        	System.out.println("inside RegisterAction: found existing user");
        	return ERROR;   // add special note about email/user existing already
        } else {
        	int id = 0;
	        try {
        		id = getUserDAO().saveUser(getModel());
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	        if (id>0) {
	        	sessionAttributes.put("LOGGEDINUSER", user);
	    		return SUCCESS;
	        } else return ERROR;
        }
	}

	@Override
	public User getModel() {
		return this.user;
	}

	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = sessionAttributes;	
	}

}
