package com.sk.dao;

import java.util.List;

import com.sk.annoation.IDao;

import entity.Ad_uva_list;
@IDao
public interface Ad_uva_list_dao {
	public List<Ad_uva_list> findAll();
	public Ad_uva_list findByName(String username);
	public void save(Ad_uva_list info);
	public void delete(String username);
	public void update(Ad_uva_list info);
}
