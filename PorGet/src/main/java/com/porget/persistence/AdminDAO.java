package com.porget.persistence;

import java.util.List;

import com.porget.domain.Criteria;
import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;

public interface AdminDAO {
	
	public List<UserVO> selectAll(Criteria cri);

	public int getTotal(Criteria cri);
	
	public int delete(String uname);

	public List<PortfolioVO> selectPortfolio();
	

}
