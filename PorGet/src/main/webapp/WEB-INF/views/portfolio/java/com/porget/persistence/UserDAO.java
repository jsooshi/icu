package com.porget.persistence;

import com.porget.domain.UserVO;

public interface UserDAO {
	public void insert(UserVO vo);
	public String login(UserVO vo);

}
