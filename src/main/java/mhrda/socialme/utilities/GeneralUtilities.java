package mhrda.socialme.utilities;

import org.apache.commons.codec.digest.DigestUtils;

public class GeneralUtilities {
	
	public static String toSHA1(String input) {
		return DigestUtils.sha1Hex(input);
	}

}
