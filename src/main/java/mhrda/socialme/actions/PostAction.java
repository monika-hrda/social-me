package mhrda.socialme.actions;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ModelDriven;

import mhrda.socialme.entities.Post;
import mhrda.socialme.entities.User;
import mhrda.socialme.interceptors.UserAware;
import mhrda.socialme.utilities.FileStorageLocations;
import mhrda.socialme.utilities.ImageHandler;

public class PostAction extends BaseAction implements UserAware, ModelDriven<Post>, ServletRequestAware {
	
	private static final long serialVersionUID = 1L;
	
	private User loggedInUser;
	private int currentProfileUserId;
	private Post post = new Post();
	
	private File image;
	private String imageContentType;
	private String imageFileName;
	
	private HttpServletRequest request;
	
	public String createPost() throws Exception {
		
		post.setByUser(loggedInUser);
		post.setForUser(getUserDAO().getUserById(currentProfileUserId));
		
		if (image != null) {
			String storageRoot = request.getServletContext().getRealPath("/");
			String subFolders = FileStorageLocations.POSTIMAGEFOLDER;
			
			ImageHandler imageHandler = new ImageHandler();
			imageHandler.saveImageWithThumbnail(image, storageRoot, subFolders, imageFileName);
			
			//If anything went wrong saving the large file, this will be null.
			if (imageHandler.getSavedImageLocation() != null) {
				post.setPostImageFileName(imageHandler.getSavedImageLocation());
			}
			
			//If anything went wrong saving the thumbnail, this will be null.
			if (imageHandler.getSavedImageLocationThumb() != null) {
				post.setPostImageFileNameThumb(imageHandler.getSavedImageLocationThumb());
			}
		}
		
		getPostDAO().createPost(post);
		
		return SUCCESS;
	}
	
	@Override
	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public User getLoggedInUser() {
		return loggedInUser;
	}

	public int getCurrentProfileUserId() {
		return currentProfileUserId;
	}

	public void setCurrentProfileUserId(int currentProfileUserId) {
		this.currentProfileUserId = currentProfileUserId;
	}

	@Override
	public Post getModel() {
		return this.post;
	}
	
	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
