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
	public List<Map<String, Object>> showPopularPart(int base) { //인기포트폴리오 게시판 스크롤 내려가면 그 다음 목록 검색해서 뿌려주기
		RowBounds bounds = new RowBounds((base-1)*9, 9);
		
		return sqlSession.selectList("portfolio.portfolioList", null, bounds);
	}

	@Override
	public List<String> searchKeyword(String keyword) {
		return sqlSession.selectList("portfolio.searchKeyword", "%"+keyword+"%");
	}

	@Override
	public List<Map<String, Object>> searchResult(String keyword) {
		return sqlSession.selectList("portfolio.searchResult", "%"+keyword+"%");
	}
	
}
