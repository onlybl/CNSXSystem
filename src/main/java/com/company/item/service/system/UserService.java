package com.company.item.service.system;

import com.company.item.model.system.User;

public interface UserService {

	User findOneByUsernameAndPassword(String username,String password);
}
