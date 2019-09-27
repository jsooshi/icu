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
	public UserVO selectMyPage(String uname);
	
	/* 시큐리티 */
	public UserVO read(String uemail);
	
	public void insertAuth(String uname);
	public void insertAuth2(String uname);
	
	/* reply 알람 */
	public int countUnread(String uname);
	public List<ReplyVO> replyNotification(String uname);
	public void checked(String uname);
}
