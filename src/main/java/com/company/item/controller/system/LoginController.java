package com.company.item.controller.system;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.company.item.model.system.User;
import com.company.item.service.system.UserService;


@Controller
@Scope("prototype")
@RequestMapping("/loginController")
public class LoginController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/login.do")
	public String login(User user) {
		if (userService.findOneByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			return "WEB-INF/index";
		}
		return "login";
	}
}