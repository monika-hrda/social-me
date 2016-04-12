package mhrda.socialme.actions;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ValidationAware;

import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;
import mhrda.socialme.utilities.FileStorageLocations;
import mhrda.socialme.utilities.ImageHandler;

public class EditProfileAction extends BaseAction implements ModelDriven<User>, UserAware, SessionAware, ServletRequestAware, ValidationAware {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private User updateUser = new User();
	
	private File profilePic;
	private String profilePicContentType;
	private String profilePicFileName;
	
	private HttpServletRequest request;
	private SessionMap<String, Object> sessionAttributes;
	
	public String saveProfile() throws Exception {
		
		User currentUser = getUserDAO().getUserById(getLoggedInUser().getUserId());
		
		//Maintains database columns that cannot be changed through the UI
		updateUser.setEmail(currentUser.getEmail());
		updateUser.setPwd(currentUser.getPwd());
		updateUser.setUserId(currentUser.getUserId());
		
		if (currentUser.getDob() != null && updateUser.getDob() == null) {
			updateUser.setDob(currentUser.getDob());
		}
		
		if (getProfilePic() != null) {
			
			try {
				String storageRoot = request.getServletContext().getRealPath("/");
				String subFolders = FileStorageLocations.PROFILEIMAGEFOLDER;
				
				ImageHandler imageHandler = new ImageHandler();
				imageHandler.saveImageWithThumbnail(profilePic, storageRoot, subFolders, profilePicFileName);
				
				if (imageHandler.getSavedImageLocation() != null) {
					updateUser.setProfileImageFilename(imageHandler.getSavedImageLocation());
				}
				
				if (imageHandler.getSavedImageLocationThumb() != null) {
					updateUser.setProfileImageFilenameThumb(imageHandler.getSavedImageLocationThumb());
				}
				
				addActionMessage("Your profile picture has been updated successfully.");
				
			} catch (Exception e) {
				e.printStackTrace();
				addActionError(e.getMessage());
				return INPUT;
			}
		} else {
			updateUser.setProfileImageFilename(currentUser.getProfileImageFilename());
			updateUser.setProfileImageFilenameThumb(currentUser.getProfileImageFilenameThumb());
		}
		
		try {
			getUserDAO().updateUser(updateUser);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
		
		sessionAttributes.put("LOGGEDINUSER", updateUser);
		addActionMessage("Your profile details have been updated successfully.");
		return SUCCESS;
	}
	
	public User getLoggedInUser() {
		return loggedInUser;
	}

	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	@Override
	public User getModel() {
		return this.updateUser;
	}

	public File getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(File profilePic) {
		this.profilePic = profilePic;
	}

	public String getProfilePicContentType() {
		return profilePicContentType;
	}

	public void setProfilePicContentType(String profilePicContentType) {
		this.profilePicContentType = profilePicContentType;
	}

	public String getProfilePicFileName() {
		return profilePicFileName;
	}

	public void setProfilePicFileName(String profilePicFileName) {
		this.profilePicFileName = profilePicFileName;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> sessionAttributes) {
		this.sessionAttributes = (SessionMap<String, Object>) sessionAttributes;
	}
	
}
