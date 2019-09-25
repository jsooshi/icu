package com.porget.control;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.porget.domain.ChatVO;
import com.porget.domain.Criteria;
import com.porget.domain.PageDTO;
import com.porget.domain.ReportVO;
import com.porget.domain.UserVO;
import com.porget.persistence.ReportDAO;
import com.porget.service.ReportService;


public class testController {

	@Autowired
	ReportService service;
	

	@RequestMapping("/reportChatting")
	public String reportChatting() {
		return "admin/report/reportChatting";
	}

	@RequestMapping("/selectChatContext")
	public @ResponseBody List<ChatVO> selectChatContext(String reporter, String defendant){
		return service.selectChatContext(reporter, defendant);
	}
	@RequestMapping("/remove")
	public String portfolioDelete(int pfnum, RedirectAttributes attr) {// 게시글 삭제후 게시판으로 이동

		if(service.removePortpolio(pfnum)) {
			attr.addFlashAttribute("result","success");
		}
		return "redirect:/portfolio";
	}
}
