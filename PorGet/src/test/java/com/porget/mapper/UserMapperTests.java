package com.porget.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.porget.domain.UserVO;
import com.porget.persistence.UserDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {

	@Setter(onMethod_ = @Autowired)
	private UserDAO userdao;
	
	@Test
	public void testRead() {
		
		log.info("check");
		UserVO vo = userdao.read("gildong@naver.com");
		
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
		
	}
}
