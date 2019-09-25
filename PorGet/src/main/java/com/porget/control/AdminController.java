package com.porget.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.Criteria;
import com.porget.domain.PageDTO;
import com.porget.domain.PortfolioVO;
import com.porget.persistence.PortfolioDAO;
import com.porget.service.AdminService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private PortfolioDAO portfolioDao;
	
	@GetMapping(value= {"/",""})
	public String all() {
		
		log.info("adminPage");
		
		return "admin/adminPage";
	}
	
	/*회원관리*/
	@GetMapping("/member")
	public String selectAll(Model m,Criteria cri) {
		
		log.info("member:"+cri.getPageNum());
		log.info(cri.getAmount());
		
		m.addAttribute("list",service.selectAll(cri));
		m.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
		return "admin/adminMember";
	}
	
	
	@DeleteMapping("/member/{uname}")
	public ResponseEntity<String> delete(@PathVariable("uname")String uname) {
		
		log.info("delete"+uname);
		
		int delCnt = service.delete(uname);
		return (delCnt == 1) ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
}
