package com.porget.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.Criteria;
import com.porget.domain.PageDTO;
import com.porget.service.AdminService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping(value= {"/",""})
	public String all() {
		
		log.info("adminPage");
		
		return "admin/adminPage";
	}
	
	@GetMapping("/member")
	public String selectAll(Model m,Criteria cri) {
		
		log.info("member:"+cri.toString());
		
		m.addAttribute("list",service.selectAll(cri));
		m.addAttribute("pageMaker",new PageDTO(cri,service.getTotal()));
		return "admin/adminMember";
	}
	
	
//	@DeleteMapping("/member/{uname}")
//	public String delete(@PathVariable("uname")String uname) {
//		
//		log.info("delete"+uname);
//		
//		adminDAO.delete(uname);
//		return "redirect:/admin";
//	}	
//	
//	@GetMapping("/member/{uname}")
//	public String selectMember(@PathVariable("uname")String uname, Model m) {
//		
//		m.addAttribute("list",adminDAO.select(uname));
//		return "admin/memberPage";
//	}
//	
	
	
//
//	//일반회원 출력	//여기하는중
//	@RequestMapping("/list")
//	public String list(Model m, String uname) {	
//		
//		log.info("list... "+ uname);
//		Map<String, String> map = new HashMap<String, String>();
//		if (uname!=null && uname.length()!=0) {
//			map.put("uname", uname);
//		}
//		
//		m.addAttribute("list", adminDAO.selectAll(map));
//		return "admin/member_ordinary";	
//	}
//	
//	//일반회원 수정하는 메소드(삭제를 위한 징검다리 역할-상세정보 보이기)
//	@RequestMapping(value="/upform",method = RequestMethod.GET)//정보 불러오기
//	public String upform(String uemail, Model m) {
//		m.addAttribute("porget", adminDAO.select(uemail));
//		return "admin/member_ordinary_edit";	
//	}
//	
//	@RequestMapping(value="/update", method = RequestMethod.POST)//db수정하기
//	public String update(UserVO vo) {
//		adminDAO.update(vo);
//		return "redirect:/admin/member_ordinary";
//		
//	}
//	
//	//일반회원 삭제
//		@RequestMapping("/delete")
//		public String delete(String uemail) {
//			adminDAO.delete(uemail);
//			return "redirect:/admin/list";
//		}
//	
	
	////////////////////////////////////////////
	
	
//	
//	//리크루터회원 출력
//	@RequestMapping("/listR")
//	public String listR(Model m, String cname) {
//		
//		Map<String, String> map = new HashMap<String, String>();
//		
//		if (cname!=null && cname.length()!=0) {
//			map.put("cname", cname);
//		}
//		
//		m.addAttribute("listR", adminDAO.selectAllRec(map));
//		return "admin/member_recruiter";	
//	}
//	
//	//리쿠르팅회원 수정하는 메소드(삭제를 위한 징검다리 역할-상세정보 보이기)
//	
//	@RequestMapping(value = "/upform2", method = RequestMethod.GET)//정보불러오기
//	public String upform2(String cemail, Model m) {
//		m.addAttribute("porgetR", adminDAO.selectRec(cemail));
//		return "admin/member_recruiter_edit";
//		
//	}
//	
//	@RequestMapping(value = "/update2", method = RequestMethod.POST)//db수정하기
//	public String update2(Porget_recruiterVO vo) {
//		adminDAO.updateRec(vo);
//		return "redirect:/admin/member_recruiter";
//		
//	}
//	
//		
//	//리쿠르터회원 삭제
//	@RequestMapping("/deleteR")
//	public String deleteR(String cemail) {
//		adminDAO.deleteRec(cemail);
//		return "redirect:/admin/listR";
//		
//	}
//	
//	@RequestMapping("/listAll")
//	public String listAll(Model m, int base) {	
//		m.addAttribute("list", adminDAO.listAll(base));
//		return "admin/member_ordinary";	
//	}
	
	
	
	
	
}
