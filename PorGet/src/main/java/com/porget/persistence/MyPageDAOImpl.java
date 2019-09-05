package com.porget.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public UserVO selectUser(String uname) {
		return sqlSession.selectOne("userList.selectUser",uname);
	}
	
	@Override
	public int changeUname(String uname) {
		return sqlSession.update("userList.changeUname",uname);
	}
	
	@Override
	public List<PortfolioVO> userPortfolio(String uname) {
		return sqlSession.selectList("userList.selectPortfolio",uname);
	}
	@Override
	public int changeUphoto(HashMap<String, String> photoName) {
		return sqlSession.update("userList.changeUphotho", photoName);
	}

}
