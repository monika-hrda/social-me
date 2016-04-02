package mhrda.socialme.utilities;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;

public class ImageHandler {
	
	public static final int THUMBNAIL_MAX_DIMENSION = 250;
	private String savedImageLocation;
	private String savedImageLocationThumb;
	
	public void saveImageWithThumbnail(File inputFile, String storageRoot, String subFolders, String originalFileName) {
		
		new File(storageRoot + subFolders).mkdirs();
		
		String uniqueFileName = GeneralUtilities.toUniqueFileName(originalFileName);
		
		String relativePathWithFile = subFolders + uniqueFileName;
		String relativePathWithThumb = subFolders + "THUMBNAIL_" + uniqueFileName;
		
		boolean largeImageSavedSuccessfully = processImage(inputFile, storageRoot + relativePathWithFile, false);
		boolean thumbImageSavedSuccessfully = processImage(inputFile, storageRoot + relativePathWithThumb, true);
		
		//If either image failed to save, just return null and no path will be set in the database.
		//The result of this is that if there is an exception saving, then the post is just saved without the image.
		if (largeImageSavedSuccessfully)
			setSavedImageLocation(relativePathWithFile);
		
		if (thumbImageSavedSuccessfully)
			setSavedImageLocationThumb(relativePathWithThumb);
	}
	
	private boolean processImage(File inputFile, String filePathAndName, boolean resize) {
		
		BufferedImage loadedImage = loadImage(inputFile);
		
		if (loadedImage == null) return false;
		
		BufferedImage imageToSave;
		
		if (resize) {
			imageToSave = resizeImage(loadedImage);
		}
		else {
			imageToSave = loadedImage;
		}
		
		if (!saveImage(imageToSave, filePathAndName)) return false;
		
		return true;
	}
	
	private BufferedImage loadImage(File inputFile) {
		
		BufferedImage loadedImage;
		
		try {
			loadedImage = ImageIO.read(inputFile);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return loadedImage;
	}
	
	private boolean saveImage(BufferedImage image, String filePathAndName) {
		
		try {
			ImageIO.write(image, FilenameUtils.getExtension(filePathAndName), new File(filePathAndName));
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	private BufferedImage resizeImage(BufferedImage originalImage) {
		
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
		
		Size newSize = getThumbnailDimensions(new Size(originalImage.getWidth(), originalImage.getHeight()));
		
		BufferedImage resizedImage = new BufferedImage(newSize.getWidth(), newSize.getHeight(), type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, newSize.getWidth(), newSize.getHeight(), null);
		g.dispose();
		
		return resizedImage;
	}
	
	/**
	 * This method takes the original size of the image and shrinks it
	 * while maintaining the ratio of width to height. It also caters for
	 * both portrait and landscape orientations.
	 */
	private Size getThumbnailDimensions(Size originalSize) {
		
		int width = originalSize.getWidth();
		int height = originalSize.getHeight();
		
		Size newSize = new Size();
		double scaleFactor;
		
		if (width > height) {
			scaleFactor = width / THUMBNAIL_MAX_DIMENSION;
			newSize.setWidth(THUMBNAIL_MAX_DIMENSION);
			newSize.setHeight((int)Math.round(height / scaleFactor));
		}
		else {
			scaleFactor = height / THUMBNAIL_MAX_DIMENSION;
			newSize.setHeight(THUMBNAIL_MAX_DIMENSION);
			newSize.setWidth((int)Math.round(width / scaleFactor));
		}
		
		return newSize;
	}
	
	public String getSavedImageLocation() {
		return savedImageLocation;
	}
	public void setSavedImageLocation(String savedImageLocation) {
		this.savedImageLocation = savedImageLocation;
	}
	public String getSavedImageLocationThumb() {
		return savedImageLocationThumb;
	}
	public void setSavedImageLocationThumb(String savedImageLocationThumb) {
		this.savedImageLocationThumb = savedImageLocationThumb;
	}
	
}
