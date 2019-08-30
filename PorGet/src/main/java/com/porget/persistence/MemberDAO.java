package com.porget.persistence;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
	
	public String selectUserPhoto(String uname);
	public List<Map<String, Object>> myPortfolio(String uname);

}
