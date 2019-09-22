package com.porget.persistence;

import java.util.List;
import java.util.Map;

import com.porget.domain.ReplyVO;
import com.porget.domain.UserVO;

public interface UserDAO {
	public void insert(UserVO vo);
	public Map<String,String> login(UserVO vo);
	public int idCheck(String uname);
	public int emailCheck(String uemail);
	
	/* 마이페이지 */
	public UserVO selectUser(String uname);
	public int countUnread(String uname);
	public List<ReplyVO> replyNotification(String uname);
	public void checked(String uname);
}
