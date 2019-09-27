package com.porget.service;

import java.util.List;
import java.util.Map;

import com.porget.domain.Criteria;

public interface AdminService {

	public List<Map<String,Object>> selectAll(Criteria cri);
	
	public int getTotal(Criteria cri);

	public int delete(String uname);



}
