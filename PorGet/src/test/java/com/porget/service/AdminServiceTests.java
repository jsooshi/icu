package com.porget.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.porget.domain.Criteria;
import com.porget.domain.UserVO;
import com.porget.persistence.AdminDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTests {
	
	@Autowired
	private AdminDAO dao;
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria(1,10);
		
		List<UserVO> list = dao.selectAll(cri);
		list.forEach(user -> log.info(user.getUname()));
		log.info("check");
	}
	
}
