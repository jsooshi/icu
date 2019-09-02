package com.porget.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl {

	@Autowired
	private SqlSession sqlSession;
	
	
}
