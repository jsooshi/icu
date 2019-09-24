package com.porget.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.porget.domain.UserVO;
import com.porget.persistence.UserDAO;
import com.porget.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
    
    @Autowired
    private UserDAO userDao;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	
    	log.warn("Load User By username:"+username);
    	
    	UserVO vo = userDao.read(username);
    	
    	log.warn("member mapper:"+vo);
    	
    	return vo == null? null: new CustomUser(vo);
    }
 
}


