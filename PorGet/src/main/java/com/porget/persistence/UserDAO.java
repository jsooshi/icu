package com.porget.persistence;

import com.porget.domain.UserVO;

public interface UserDAO {
	public void insert(UserVO vo);
	public int login(UserVO vo);

}
