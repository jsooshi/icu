package com.porget.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.PortfolioVO;

@Repository
public class PortfolioDAOImpl implements PortfolioDAO{
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<Map<String, Object>> showPopularPart(int base) {
		RowBounds bounds = new RowBounds((base-1)*9, 9);
		
		return sqlSession.selectList("portfolio.portfolioList", null, bounds);
	}
	
}
