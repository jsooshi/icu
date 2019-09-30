package com.porget.persistence;

import java.util.HashMap;
import java.util.List;

import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;

public interface MyPageDAO {
	
	public UserVO selectUser(String uname);//프로필 출력 
	public List<PortfolioVO> userPortfolio(String uname);//포트폴리오 출력
	//북마크 출력
	
	public int changeUname(String uname);//닉네임변경
	public int changeUphoto(HashMap<String,String> photoName);
	public List<PortfolioVO> likePortfolio(String uname);
	public int breakMember(String uname);
	
}
