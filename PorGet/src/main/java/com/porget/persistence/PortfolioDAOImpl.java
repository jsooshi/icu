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
	public List<Map> selectPortfolio(int pfnum) {
		return sqlSession.selectList("portfolio.portfolioView",pfnum);
	}
	
	@Override
	public int updatePortfolio(PortfolioVO vo) {
		return sqlSession.update("portfolio.updatePf",vo);
	}
	
	@Override
	public PortfolioVO selectUpdate(int pfnum) {
		return sqlSession.selectOne("portfolio.selectUpdate",pfnum);
	}
	
	@Override
	public int deletePortfolio(int pfnum) {
		return sqlSession.delete("portfolio.deletePf",pfnum);
	}

	/* 좋아요 */
	
	@Override
	public int insertRecommend(Map<String,Object> map) {
		return sqlSession.insert("portfolio.insertRecommend",map);
	}
	
	@Override
	public int deleteRecommend(Map<String, Object> map) {
		return sqlSession.delete("portfolio.deleteRecommend",map);
	}

	@Override
	public int distinctRecommend(Map<String,Object> list) {
		return sqlSession.selectOne("portfolio.distinctRecommend",list);
	}
	
	@Override
	public List<Map<String, Object>> showPopularPart(int base) { //인기포트폴리오 게시판 스크롤 내려가면 그 다음 목록 검색해서 뿌려주기
		RowBounds bounds = new RowBounds((base-1)*6, 6);
		
		return sqlSession.selectList("portfolio.portfolioList", null, bounds);
	}


	@Override
	public List<Map<String, Object>> searchResult(String keyword) {
		System.out.println("#붙인 키워드"+keyword);
		return sqlSession.selectList("portfolio.searchResult", "%"+keyword+"%");
	}

	@Override
	public List<Map<String, Object>> searchHashResult(String keyword, int base) {
		System.out.println("#붙인 키워드"+keyword);
		System.out.println("DAO base>>"+base);
		RowBounds bounds = new RowBounds((base-1)*6, 6);
		System.out.println("Bounds>>"+bounds);
		return sqlSession.selectList("portfolio.searchResult", "%"+keyword+"%", bounds);
	}
	@Override
	public List<Map<String, Object>> searchNameList(String keyword) {//제목으로 검색시
		return sqlSession.selectList("portfolio.searchNameList", "%"+keyword+"%");
	}

	@Override
	public List<Map<String, Object>> searchKeyword(String keyword) {//에이작스 위한 샵없는 키워드 검색
		return sqlSession.selectList("portfolio.searchKeyword", "%"+keyword+"%");
	}
	@Override
	public List<String> searchTag(String keyword) {//샵있는 키워드 검색
		return sqlSession.selectList("portfolio.searchTag", "%"+keyword+"%");
	}

	@Override
	public List<String> searchName(String keyword) {
		return sqlSession.selectList("portfolio.searchName", "%"+keyword+"%");
	}

	@Override
	public List<Map<String, Object>> searchTagList(String keyword) {
		return sqlSession.selectList("portfolio.searchResult", "%"+keyword+"%");
	}
	
	@Override
	public List<Map> mainPopular() {
		return sqlSession.selectList("portfolio.mainPopular");
	}
	
	@Override
	public List<Map> mainRecent() {
		return sqlSession.selectList("portfolio.recentPortfolio");
	}
}
