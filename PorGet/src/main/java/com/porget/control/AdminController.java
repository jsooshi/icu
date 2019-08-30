package com.porget.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.porget.domain.Porget_recruiterVO;
import com.porget.domain.Portget_ordinaryVO;
import com.porget.persistence.PorgetDAO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private PorgetDAO porgetDAO;
	
	@RequestMapping("/all")
	public String all() {
		return "admin/member_all";
		
	}
	
	
	//폼 보이기
	@RequestMapping("/form")
	public String form() {
		
		return "admin/member_ordinary";
	}
	
	//일반회원 출력
	@RequestMapping("/list")
	public String list(Model m) {	
		m.addAttribute("list", porgetDAO.selectAll());
		return "admin/member_ordinary";	
	}
	
	//일반회원 수정하는 메소드(삭제를 위한 징검다리 역할-상세정보 보이기)
	@RequestMapping(value="/upform",method = RequestMethod.GET)//정보 불러오기
	public String upform(String uemail, Model m) {
		m.addAttribute("porget", porgetDAO.select(uemail));
		return "admin/member_ordinary_edit";	
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)//db수정하기
	public String update(Portget_ordinaryVO vo) {
		porgetDAO.update(vo);
		return "redirect:/admin/member_ordinary";
		
	}
	
	//일반회원 삭제
		@RequestMapping("/delete")
		public String delete(String uemail) {
			porgetDAO.delete(uemail);
			return "redirect:/admin/list";
		}
	
	
	////////////////////////////////////////////
	
	
	
	//리크루터회원 출력
	@RequestMapping("/listR")
	public String listR(Model m) {
		m.addAttribute("listR", porgetDAO.selectAllRec());
		return "admin/member_recruiter";	
	}
	
	//리쿠르팅회원 수정하는 메소드(삭제를 위한 징검다리 역할-상세정보 보이기)
	
	@RequestMapping(value = "/upform2", method = RequestMethod.GET)//정보불러오기
	public String upform2(String cemail, Model m) {
		m.addAttribute("porgetR", porgetDAO.selectRec(cemail));
		return "admin/member_recruiter_edit";
		
	}
	
	@RequestMapping(value = "/update2", method = RequestMethod.POST)//db수정하기
	public String update2(Porget_recruiterVO vo) {
		porgetDAO.updateRec(vo);
		return "redirect:/admin/member_recruiter";
		
	}
	
		
	//리쿠르터회원 삭제
	@RequestMapping("/deleteR")
	public String deleteR(String cemail) {
		porgetDAO.deleteRec(cemail);
		return "redirect:/admin/listR";
		
	}
	
	
	
	
	
	
	
}
