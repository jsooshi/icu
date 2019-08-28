package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.PortfolioVO;

public interface PortfolioDAO {
	
	public List<Map<String, Object>> showPopularPart(int base);
	
}
