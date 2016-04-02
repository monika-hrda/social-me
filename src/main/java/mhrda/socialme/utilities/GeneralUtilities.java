package mhrda.socialme.utilities;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FilenameUtils;

public class GeneralUtilities {
	
	public static String toSHA1(String input) {
		return DigestUtils.sha1Hex(input);
	}
	
	public static String toUniqueFileName(String originalFileName) {
		
		//Need the original file extension to preserve integrity (jpeg, png, etc.)
		String originalExtension = FilenameUtils.getExtension(originalFileName);
		
		//Generates a unique filename so that the same image is never referenced twice.
		//Another option here would be the current date and time accurate to the millisecond plus the original filename together.
		String randomUniqueFileName = java.util.UUID.randomUUID().toString();
		
		return randomUniqueFileName + "." + originalExtension;
	}

}
