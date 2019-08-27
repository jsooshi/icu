package com.porget.persistence;

import java.util.List;

import com.porget.domain.PortfolioVO;

public interface PortfolioDAO {
	
	public int insertPortfolio(PortfolioVO vo);
	public List<PortfolioVO> allPortfolio();
	public List<PortfolioVO> onePortfolio(String uname);
	

}
