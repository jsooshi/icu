package com.porget.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.porget.domain.Criteria;
import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;
import com.porget.persistence.AdminDAO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<UserVO> selectAll(Criteria cri){
		log.info("list:"+ cri);
		return dao.selectAll(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotal(cri);
	}
	
	@Override
	public int delete(String uname) {
		return dao.delete(uname);
	}
	
}
