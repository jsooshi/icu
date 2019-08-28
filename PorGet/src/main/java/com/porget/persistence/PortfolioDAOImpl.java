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

	/* 포트폴리오 CRUD */
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
	public List<PortfolioVO> onePortfolio(int pfnum) {
		return sqlSession.selectList("portfolio.onePortfolio",pfnum);
	}
	
	@Override
	public int updatePortfolio(PortfolioVO vo) {
		return sqlSession.update("portfolio.updatePf",vo);
	}
	
	@Override
	public int deletePortfolio(int pfnum) {
		return sqlSession.delete("portfolio.deletePf",pfnum);
	}

	/* 좋아요 */
	
	@Override
	public int insertRecommend(PortfolioVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRecommend(int pfnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int distinctRecommend(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
}
