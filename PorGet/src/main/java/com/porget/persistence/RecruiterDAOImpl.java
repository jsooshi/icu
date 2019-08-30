package com.porget.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.RecruiterVO;

@Repository
public class RecruiterDAOImpl implements RecruiterDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(RecruiterVO rvo) {
		sqlSession.insert("recruiter.insert",rvo);
		
	}

	@Override
	public String login(RecruiterVO rvo) {
		return sqlSession.selectOne("recruiter.login",rvo);
	}

	

}
