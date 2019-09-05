package com.porget.persistence;

import com.porget.domain.UserVO;

public interface RecruiterDAO {
	public void insertRecruiter(UserVO vo);
	public String loginRecruiter(UserVO vo);
	public int cidCheck(String cname);
	public int cemailCheck(String cemail);

}
