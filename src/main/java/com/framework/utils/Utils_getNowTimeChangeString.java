package com.framework.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>
 * 工具：得到系统时间变成字符串
 * </p>
 * 
 * @Copyright (C),华清远见
 * @author zlf
 * @Date:2017年7月21日
 */
public class Utils_getNowTimeChangeString {

	public static String getNowTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	public static boolean isNotEmpty(String str) {
		boolean flag = false;
		if (str != null && !str.equals("")) {
			flag = true;
		}
		return flag;
	}
}
