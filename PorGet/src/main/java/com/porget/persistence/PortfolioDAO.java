package com.porget.persistence;

import java.util.List;
import java.util.Map;
import com.porget.domain.PortfolioVO;

public interface PortfolioDAO {// 포트폴리오 관련 DAO
	
	/* 포트폴리오 CRUD */
	public int insertPortfolio(PortfolioVO vo); //글생성
	public List<PortfolioVO> allPortfolio();    //전체목록 출력
	public List<PortfolioVO> onePortfolio(int pfnum);// 게시글 한개 출력
	public int updatePortfolio(PortfolioVO vo); //게시글 업데이트
	public int deletePortfolio(int pfnum); // 게시글 삭제
	
	/* 좋아요 */
	public int insertRecommend(PortfolioVO vo);
	public int selectRecommend(int pfnum);
	public int distinctRecommend(int num);

	public List<Map<String, Object>> showPopularPart(int base);
	public List<Map<String, Object>> searchKeyword(String keyword);
	public List<Map<String, Object>> searchResult(String keyword);
	public List<String> searchTag(String keyword);
	public List<String> searchName(String keyword);
	public List<Map<String, Object>> searchNameList(String keyword);
	public List<Map<String, Object>> searchTagList(String keyword);
	
	}
