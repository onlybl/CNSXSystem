package com.framework.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间格式工具
 * 
 * @Copyright (C),TPOE
 * @author lf
 * @Date:2015年2月6日
 */
public class TimeFormatUtil {

	/**
	 * 得到时间格式方法：yyyy-MM-dd HH:mm:ss
	 * 
	 * @author lf
	 * @Date 2015年2月6日
	 * @return
	 */
	public static String getNowTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	/**
	 * 得到时间格式方法：yyyyMMddHHmmss
	 * 
	 * @author lf
	 * @Date 2015年2月6日
	 * @return
	 */
	public static String getNowTimeNoSpace() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date());
	}
}
