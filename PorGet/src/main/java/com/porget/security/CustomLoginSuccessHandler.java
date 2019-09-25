package com.porget.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.porget.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("login success");
		
		List<String> roleNames = new ArrayList<>(); 
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		log.warn("ROLE_NAME:"+roleNames); 
		
		HttpSession session = request.getSession(true);
		CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		log.info(user.getUser().getUname());
		log.info(user.getUser().getUphoto());
		
		session.setAttribute("uname",user.getUser().getUname());
		session.setAttribute("uphoto",user.getUser().getUphoto());

		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/porget/admin");
			return; 
		}
		response.sendRedirect("/porget");
	}
	
	
}
