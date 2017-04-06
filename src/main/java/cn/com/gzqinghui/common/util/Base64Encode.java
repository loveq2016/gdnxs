package cn.com.gzqinghui.common.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;

public class Base64Encode {

	//火狐浏览器 --- Base64编码
	public static String base64EncodeFileName(String fileName) {
		BASE64Encoder base64Encoder = new BASE64Encoder();
		try {
			return "=?UTF-8?B?" + base64Encoder.encode(fileName.getBytes("UTF-8")) + "?=";
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}

}
