package com.sk.dao;

import com.sk.annoation.IDao;

import entity.User_info;

@IDao
public interface User_info_dao {
	public User_info findByName(String name);
	public void save(User_info info);
}
