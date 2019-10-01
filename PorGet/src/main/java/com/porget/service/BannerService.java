package com.porget.service;

import java.util.Map;

import org.springframework.stereotype.Repository;

public interface BannerService {

	public boolean insertBanner(int pfnum);
	public Map<String,Object> selectBannerPortfolio();
}
