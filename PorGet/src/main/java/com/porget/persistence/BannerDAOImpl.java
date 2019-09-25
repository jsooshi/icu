package com.porget.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BannerDAOImpl implements BannerDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertBanner(int pfnum) {
		return sqlSession.insert("banner.insertBanner",pfnum);
	}

	@Override
	public Map<String, Object> selectBannerPortfolio() {
		return sqlSession.selectOne("banner.selectBannerPortfolio");
	}

}
