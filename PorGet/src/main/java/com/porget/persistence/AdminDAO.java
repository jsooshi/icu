package com.porget.persistence;

import java.util.List;

import com.porget.domain.Criteria;
import com.porget.domain.UserVO;

public interface AdminDAO {
	
	public List<UserVO> selectAll(Criteria cri);

	public int getTotal();
	
	
	
	
	public UserVO select(String uemail);
	
	public void update(UserVO vo);
	
	public void delete(String uname);
	
	public List<UserVO> listAll(int base);
}
