package com.porget.persistence;

import java.util.List;
import java.util.Map;
import com.porget.domain.PortfolioVO;

public interface PortfolioDAO {// 포트폴리오 관련 DAO
	
	/* 포트폴리오 CRUD */
	public int insertPortfolio(PortfolioVO vo); //글생성
	public int updatePortfolio(PortfolioVO vo); //게시글 업데이트
	public int deletePortfolio(int pfnum); // 게시글 삭제
	public PortfolioVO selectUpdate(int pfnum); // 게시글 수정뷰
	public List<Map> selectPortfolio(int pfnum); // 게시글 출력
	
	/* 좋아요 */
	public int insertRecommend(Map<String,Object> map);
	public int deleteRecommend(Map<String,Object> map);
	public int distinctRecommend(Map<String,Object> list);

	/* 검색 */
	public List<Map<String, Object>> showPopularPart(int base);
	public List<String> searchKeyword(String keyword);
	public List<Map<String, Object>> searchResult(String keyword);
	
	/* 메인 인기, 최근 */
	public List<Map> mainPopular();
	public List<Map> mainRecent();
	
	}
