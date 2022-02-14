package com.service;

import com.po.User;

public interface UserService {

    User checkUser(String username, String password);
}
