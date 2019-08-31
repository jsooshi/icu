package com.porget.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
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
	public PortfolioVO onePortfolio(int pfnum) {
		return sqlSession.selectOne("portfolio.onePortfolio",pfnum);
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
	
	@Override
	public List<Map<String, Object>> showPopularPart(int base) { //인기포트폴리오 게시판 스크롤 내려가면 그 다음 목록 검색해서 뿌려주기
		RowBounds bounds = new RowBounds((base-1)*6, 6);
		
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
