package com.company.item.service.system.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.company.item.dao.system.UserMapper;
import com.company.item.model.system.User;
import com.company.item.service.system.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;

	public User findOneByUsernameAndPassword(String username, String password) {
		return userMapper.selectByUsernameAndPassword(new User(username,password));
	}

}

