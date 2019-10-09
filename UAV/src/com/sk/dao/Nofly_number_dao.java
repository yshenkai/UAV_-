package com.sk.dao;

import java.util.List;

import com.sk.annoation.IDao;

import entity.Nofly_number;
@IDao
public interface Nofly_number_dao {
	public void save(Nofly_number nofly_number);
	public void delete(String number);
	public Nofly_number findByNumber(String number);
	public void update(Nofly_number nofly_number);
	public List<Nofly_number> findAll();
	public void deleteByLowTime(Long intimeLong);
	public List<Nofly_number> findByUpTime(Long intimeLong);
}
