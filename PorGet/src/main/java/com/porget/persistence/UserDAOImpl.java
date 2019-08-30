package com.porget.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(UserVO vo) {
		sqlSession.insert("userList.insert",vo);
		
	}

	@Override
	public String login(UserVO vo) {
		return sqlSession.selectOne("userList.login",vo);
	}

	@Override
	public int idCheck(String uname) {
		System.out.println("sqlSession="+ sqlSession+", uname="+uname);
		return sqlSession.selectOne("userList.idCheck",uname);
	}

	@Override
	public int emailCheck(String uemail) {
		return sqlSession.selectOne("userList.emailCheck",uemail);
	}



}
