package com.framework.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

public class BaseController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3412511940987849417L;
	private static final int PageSize = 10;

	//
	public void writetoPage(HttpServletResponse response, String s) {
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(s);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static int getPagesize() {
		return PageSize;
	}

	/**
	 * <p>
	 * 时间属性的编辑器
	 * </p>
	 * 
	 * @author zlf
	 * @Date 2017年6月4日
	 * @param servletRequestDataBinder
	 */
	@InitBinder
	public void initBinder(ServletRequestDataBinder servletRequestDataBinder) {
		servletRequestDataBinder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

}
