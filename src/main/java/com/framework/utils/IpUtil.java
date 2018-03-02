package com.framework.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * IP工具类
 * 
 * @Copyright (C),沪友科技
 * @author zlf
 * @Date:2015年11月13日
 */
public class IpUtil {
	/**
	 * 获取登录用户IP地址
	 * 
	 * @author zlf
	 * @Date 2015年11月13日
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "本地";
		}
		return ip;
	}

}
