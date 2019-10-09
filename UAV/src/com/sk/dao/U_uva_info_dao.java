package com.sk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sk.annoation.IDao;

import entity.Test_uva_info;

@IDao
public interface U_uva_info_dao {
	public void createTable(@Param("tablename") String tablename);
	public List<Test_uva_info> findAll(@Param("tablename") String tablename);
	public List<String> findtable();
	public void save(Test_uva_info info);
	public void update(Test_uva_info info);
}
