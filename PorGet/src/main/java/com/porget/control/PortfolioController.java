package com.porget.control;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.porget.domain.PortfolioVO;
import com.porget.persistence.PortfolioDAO;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController {

	@Autowired
	private PortfolioDAO dao;

	
	@RequestMapping(value = {"","/"} )
	public String portfolio(Model m) { 
		return "portfolio/portfolioBoard";
	}


	@GetMapping("/post")
	public String portfolioPost() { // 글생성 창
		return "portfolio/portfolioPost";
	}
	
	@PostMapping("/post")
	public String portfolioInsert(MultipartFile[] uploadFile, PortfolioVO vo, HttpServletRequest request) { // 글 생성 후 포트폴리오 게시판으로 이동
		// vo=> pfname, pfurl, pfposition, tagname
		System.out.println((String)request.getSession().getAttribute("uname"));
		vo.setUname((String)request.getSession().getAttribute("uname"));
		
		String ptthumb="";
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/files");
		System.out.println(uploadFolder);
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("------------");
			System.out.println("multiName : " + multipartFile.getName());
			System.out.println("upload file name : " + multipartFile.getOriginalFilename());
			System.out.println("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			ptthumb += uploadFileName+"|";
			System.out.println("only file name : "+ uploadFileName);
			File saveFile = new File(uploadFolder,uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
				System.out.println("성공");
			} catch (IllegalStateException | IOException e) {
				System.out.println("icy...");
				e.printStackTrace();
			}
			
		}
		
	
		vo.setPfthumb(ptthumb); // 썸네일
		vo.setPffile("cat.jpg"); // 사진파일경로

		System.out.println("포트폴리오 업로드 vo>>"+vo);
		if (dao.insertPortfolio(vo) == 1) {
			System.out.println("추가성공");
		} else {
			System.out.println("추가실패");
		}
		return "redirect:/portfolio";
	}


	@GetMapping("/view")
	public String portfolioView(int pfnum,HttpServletRequest request) {// 게시글 클릭시 포트폴리오 뷰
		List<Map> list = dao.selectPortfolio(pfnum);
		request.setAttribute("list",list.get(0));
		request.setAttribute("realPath", request.getSession().getServletContext().getRealPath("/resources/files"));
		request.setAttribute("thumb",((String)list.get(0).get("PFTHUMB")).split("\\|"));
		return "portfolio/portfolioView";
	}

	@GetMapping("/update")
	public String portfolioUpdateView(int pfnum, Model m) {// 게시글 수정뷰
		
		PortfolioVO vo = dao.selectUpdate(pfnum);
		System.out.println(vo);
		String[] thumbsList = vo.getPfthumb().split("\\|");
		String thumbs = "[";
		m.addAttribute("p", vo);
		for (int i = 0; i < thumbsList.length; i++) {
			thumbs+="\"";
			System.out.println(thumbsList[i]);
			thumbs+=thumbsList[i];
			thumbs+="\"";
			if(i+1<thumbsList.length) {
				thumbs+=",";
			}
		}
		thumbs+="]";
		m.addAttribute("thumbs",thumbs);
		return "portfolio/portfolioUpdate";
	}

	@PostMapping("/update")
	public String portfolioUpdate(MultipartFile[] uploadFile,String[] originalFileName,String[] keepFileName, PortfolioVO vo, HttpServletRequest request, Model m) {// 게시글 수정완료 후 본인글로 이동

		/* 임시로 추가하는 VO */
		vo.setPffile("dog.jpg"); // 사진파일경로
		
		String ptthumb="";
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/files");
		System.out.println(uploadFolder);
		for(String removeName : originalFileName) {
			System.out.println(removeName);
			int remove = 0;
			if(keepFileName!=null) {
				for(String keepName : keepFileName) {
					if(removeName.equals(keepName)) {
						ptthumb+=keepName+"|";
						remove = 1;
						break;
					}
				}
			}
			if(remove==0) {
				File removeFile = new File(uploadFolder,removeName);
				System.out.println("파일 이름 보고 가 : "+removeName);
				if(removeFile.isFile()) {
					System.out.println("있으니까 지운다");
					removeFile.delete();
				}
			}
		}
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("------------");
			System.out.println("upload file name : " + multipartFile.getOriginalFilename());
			System.out.println("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			ptthumb += uploadFileName+"|";
			System.out.println("only file name : "+ uploadFileName);
			File saveFile = new File(uploadFolder,uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				System.out.println("성공");
			} catch (IllegalStateException | IOException e) {
				System.out.println("icy...");
				e.printStackTrace();
			}
			
		}
		System.out.println(ptthumb);
		vo.setPfthumb(ptthumb); // 썸네일
		

		if (dao.updatePortfolio(vo) == 1) {
			System.out.println("수정성공");
		} else {
			System.out.println("수정실패");
		}
		return "redirect:/portfolio/view?pfnum=" + vo.getPfnum();
	}

	@RequestMapping("/delete")
	public String portfolioDelete(int pfnum) {// 게시글 삭제후 게시판으로 이동

		if (dao.deletePortfolio(pfnum) == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		return "redirect:/portfolio";
	}
	
	@RequestMapping("/partPopular")
	public String showPopularPart(Model m, int base) { //인기포트폴리오 게시판 스크롤 내려가면 그 다음 목록 검색해서 뿌려주기
		System.out.println("base"+base);
		List<Map<String, Object>> list = dao.showPopularPart(base);
		m.addAttribute("list", list);
		return "portfolio/cardPost";
	}
	
	/*좋아요 기능*/
	@RequestMapping("/good")
	public @ResponseBody int insertGood(int pfnum,HttpSession session) {
		String uname = (String) session.getAttribute("uname");
		Map<String,Object> recommend = new HashMap<String,Object>();
		recommend.put("pfnum", pfnum);
		recommend.put("uname", uname);
		System.out.println(recommend);
		if(dao.distinctRecommend(recommend)==0) {
			dao.insertRecommend(recommend);
		}else {
			dao.deleteRecommend(recommend);
		}
		return dao.selectRecommend(pfnum);
	}

}
