package com.framework.utils;

/**
 * 判断字符是否为空工具
 * 
 * @Copyright (C),TPOE
 * @author lf
 * @Date:2015年2月6日
 */
public class StringIsNotEmptyUtil {

	/**
	 * 判断是否为空方法
	 * 
	 * @author lf
	 * @Date 2015年2月6日
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str) {
		boolean flag = false;
		if (str != null && !str.equals("")) {
			flag = true;
		}
		return flag;
	}
}
