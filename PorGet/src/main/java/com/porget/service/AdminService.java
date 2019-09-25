package com.porget.service;

import java.util.List;

import com.porget.domain.Criteria;
import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;

public interface AdminService {

	public List<UserVO> selectAll(Criteria cri);
	
	public int getTotal(Criteria cri);

	public int delete(String uname);



}
