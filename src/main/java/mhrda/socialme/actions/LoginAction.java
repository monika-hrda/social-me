package mhrda.socialme.actions;

import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;
import org.hibernate.SessionFactory;

import mhrda.socialme.dao.UserDAO;
import mhrda.socialme.dao.UserDAOImpl;
import mhrda.socialme.entities.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User>, ServletContextAware {

	private static final long serialVersionUID = -34963371525332562L;
	
	private User user = new User();
	
	private ServletContext ctx;

	@Override
	public String execute() throws Exception {
		SessionFactory sf = (SessionFactory) ctx.getAttribute("SessionFactory");
        UserDAO userDAO = new UserDAOImpl(sf);
        User userDB = userDAO.getUserByCredentials(user.getEmail(), user.getPwd());
        if(userDB == null) return ERROR;
        else {
            user.setUserId(userDB.getUserId());
            user.setFirstName(userDB.getFirstName());
            user.setLastName(userDB.getLastName());
            return SUCCESS;
        }
	}

	@Override
	public User getModel() {
		return user;
	}
	
	@Override
	public void setServletContext(ServletContext sc) {
		this.ctx = sc;		
	}
}
