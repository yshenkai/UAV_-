package com.sk.dao;

import java.util.List;

import com.sk.annoation.IDao;

import entity.No_fly;
@IDao
public interface No_fly_dao {
	public void save(No_fly fly);
	public List<No_fly> findAll();
}
