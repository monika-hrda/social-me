package mhrda.socialme.actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ModelDriven;

public class ShowProfileAction extends BaseAction implements ModelDriven<User>, RequestAware {

	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	private Map<String,Object> requestAttributes;

	@Override
	public String execute() throws Exception {
		System.out.println("inside ShowProfileAction execute");
//		String test = (String) requestAttributes.get("testing");
//		System.out.println("value of testing is:" + test);
		int userId = (int) requestAttributes.get("userId");
		user = getUserDAO().getUserById(userId);
		if(user == null) return ERROR;
		return SUCCESS;
//		User userDB = getUserDAO().getUserById(userId);
//		if(userDB == null) return ERROR;
//        else {
//            user.setFirstName(userDB.getFirstName());
//            user.setLastName(userDB.getLastName());
//            user.setPwd(userDB.getPwd());
//            user.setEmail(userDB.getEmail());
//            return SUCCESS;
//        }
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public User getModel() {
		return this.user;
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.requestAttributes = request;
	}

}
