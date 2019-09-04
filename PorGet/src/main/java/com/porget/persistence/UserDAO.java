package com.porget.persistence;

import com.porget.domain.UserVO;

public interface UserDAO {
	public void insert(UserVO vo);
	public String login(UserVO vo);
	public int idCheck(String uname);
	public int emailCheck(String uemail);
	
	/* 마이페이지 */
	public UserVO selectMyPage(String uname);
	
	
	
}
