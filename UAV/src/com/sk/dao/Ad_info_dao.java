package com.sk.dao;

import java.util.List;

import com.sk.annoation.IDao;

import entity.Ad_info;

@IDao
public interface Ad_info_dao {
	//public void save(Ad_info info);
	public List<Ad_info> findAll();
	public Ad_info findByName(String name);
}
