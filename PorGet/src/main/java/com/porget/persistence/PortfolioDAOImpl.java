package com.porget.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.porget.domain.PortfolioVO;

@Repository
public class PortfolioDAOImpl implements PortfolioDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public int insertPortfolio(PortfolioVO vo) {
		System.out.println("dao>"+vo);
		return sqlSession.insert("portfolio.insertPortfolio",vo);
	}

	@Override
	public List<PortfolioVO> allPortfolio() {
		return sqlSession.selectList("portfolio.allPortfolio");
	}

	@Override
	public List<PortfolioVO> onePortfolio(String uname) {
		return null;
	}
	
	
}
