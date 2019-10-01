package com.porget.persistence;

import java.util.Map;

public interface BannerDAO {

	public int insertBanner(int pfnum);
	public Map<String,Object> selectBannerPortfolio();
}
