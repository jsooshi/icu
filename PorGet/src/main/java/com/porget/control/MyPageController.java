package com.porget.control;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;
import com.porget.persistence.MyPageDAO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageDAO dao;
	
	@GetMapping(value={"","/"})
	public String selectMyPage(HttpSession session, Model m) {
		String uname = (String)session.getAttribute("uname");
		UserVO vo = dao.selectUser(uname);
		m.addAttribute("vo",vo);
		
		List<PortfolioVO> portfolioVO = dao.userPortfolio(uname);
		System.out.println(portfolioVO);
		for (int i=0;i<portfolioVO.size();i++) {
			PortfolioVO pvo =portfolioVO.get(i);
			pvo.setPfthumb(pvo.getPfthumb().split("\\|")[0]);
		}
		m.addAttribute("pvo",portfolioVO);
		return "member/myPage";
	}
	
	@PostMapping("/changeuname")
	public String changeUname(String uname) { //추후 변경
		System.out.println(uname);
		if(dao.changeUname(uname)==1) {
			return "수정되었습니다.";
		}else {
			return "오류가 발생하였습니다.";
		}
	}
	
	@RequestMapping("/changeuphoto")
	public @ResponseBody String changeUphoto(HttpServletRequest request,MultipartFile photo) {
		String removeName = (String) request.getSession().getAttribute("uphoto");
		String uname = (String) request.getSession().getAttribute("uname");
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/files/profile/");
		File removeFile = new File(uploadFolder,removeName);
		if(removeFile.isFile()) {
			removeFile.delete();
		}
		String photoFileName = photo.getOriginalFilename();
		photoFileName = photoFileName.substring(photoFileName.lastIndexOf("\\")+1);
		UUID uuid = UUID.randomUUID();
		photoFileName = uuid.toString()+"_"+photoFileName;
		File saveFile = new File(request.getSession().getServletContext().getRealPath("/resources/files/profile/"),photoFileName);
		try {
			photo.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return "fail";
		}
		HashMap<String, String> photoName = new HashMap<String, String>();
		photoName.put("uname", uname);
		photoName.put("uphoto", photoFileName);
		if(dao.changeUphoto(photoName)==1) {
			request.getSession().setAttribute("uphoto", photoFileName);
			return "success";
		}
		return "fail";
	}
	
	
}
