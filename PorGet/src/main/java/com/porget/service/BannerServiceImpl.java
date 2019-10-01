package com.porget.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.persistence.BannerDAO;

@Repository
public class BannerServiceImpl implements BannerService{

	@Autowired
	BannerDAO dao;
	
	@Override
	public boolean insertBanner(int pfnum) {
		if(dao.insertBanner(pfnum)==1) return true;
		return false;
	}

	@Override
	public Map<String, Object> selectBannerPortfolio() {
		Map<String,Object> map = dao.selectBannerPortfolio();
		if(map!=null) {
			map.put("PFTHUMB",map.get("PFTHUMB").toString().split("\\|")[0]);
		}
		return map;
	}

}
