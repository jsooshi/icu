package com.spring.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) //현재 테스트 코드가 스프링을 실행하는 역할임을 표시 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //root-context 경로 지정
@Log4j
public class SampleTest {
	
	@Setter(onMethod_ = {@Autowired})
	private Restaurant restaurant;
	
	@Test // JUnit에서 테스트대상을 표시하는 어노테이션 
	public void testExist() {
		
		assertNotNull(restaurant); //null이 아니어야만 테스트가 성공함을 의미
		
		log.info(restaurant);
		log.info(restaurant.getChef());
	}

}
