package com.porget.control;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.porget.domain.UserVO;
import com.porget.persistence.PortfolioDAO;
import com.porget.persistence.UserDAO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
	@Autowired
	private PortfolioDAO dao;
	
	@Autowired
	private UserDAO userdao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping(value= {"/",""})
	public String index() {
		
		return "main/index";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)//메인폼에서 회원가입누르면 리크루터 구직자 선택
	public String userJoinForm() {
		
		return "member/memberJoin";
	}
	
	@GetMapping("/userjoin")//구직자 회원가입 폼
	public String insertUser() {
		
		return "member/userJoin";
	}
	
	@PostMapping("/userjoin")//구직자 DB 회원가입 
    public String userJoin(MultipartFile file,UserVO vo,  
    				HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("구직자 회원가입vo="+vo); 
        	
    	vo.setUphoto("defaultMan.png");
        
        //비밀번호 암호화
        vo.setUpass(this.bcryptPasswordEncoder.encode(vo.getUpass()));
        
        userdao.insert(vo);
        userdao.insertAuth(vo.getUname());
        
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		response.getWriter().print("<script>alert('회원가입을 축하드립니다.');</script>");
		out.flush();
		return "main/index";
	}
	
	@GetMapping("/recrujoin")//리쿠르터 회원가입 폼
	public String recruitjJinForm() {
		
		return "member/recruiterJoin";
	}
	
	@PostMapping("/recrujoin")//리쿠르터 DB 회원가입 
	public String insertRecruit(MultipartFile file, UserVO vo,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("리크루터 회원가입vo="+vo);
		
		vo.setUphoto("defaultMan.png");
		
        //비밀번호 암호화
        vo.setUpass(this.bcryptPasswordEncoder.encode(vo.getUpass()));
        
        userdao.insert(vo);
        userdao.insertAuth2(vo.getUname());
		
        response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		response.getWriter().print("<script>alert('회원가입을 축하드립니다.');</script>");
		out.flush();
		return "main/index";
	}
	
	
	@GetMapping("/login")//로그인창 보여주기
	public String login() {
		
		return "common/login";
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String loginSuccess(String uemail,String error, String logout, Model model,Authentication authentication,HttpSession session){//로그인시 세션 저장
//		
//		log.info(uemail);
//		
//		log.info("login------");
//		log.info("error:"+error);
//		log.info("logout:"+logout);
//		
//		if(error!=null) {
//			model.addAttribute("error","Login Error");
//		}
//		
//		if(logout != null) {
//			model.addAttribute("logout", "logout");
//		}
//		return "redirect:/";
//		
//		Map<String,String> map = (Map<String, String>) userdao.login(vo);
//		if(map != null) {
//			session.setAttribute("uname",map.get("UNAME"));
//			System.out.println(map.get("UNAME"));
//			session.setAttribute("uphoto",map.get("UPHOTO"));
//			System.out.println("멤버 로그인 성공");
//			return "redirect:/";
//		}else {
//			System.out.println("멤버 로그인 실패");
//			attrs.addFlashAttribute("msg", "이메일과 비밀번호를 확인해주세요");
//			return "redirect:/";
//		}
//	}
	
	@RequestMapping(value = "/recruiterLogin", method = RequestMethod.GET)//로그인창 보여주기
	public String recruiter() {
		
		
		return "main/recruiterLogin";
	}
	

	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("checkId")
	public @ResponseBody String checkId(String nickName) {
		System.out.println(">>>checkId:"+nickName);
		
		String msg;
		if(userdao.idCheck(nickName)==0) {
			msg="<font color=blue>사용가능한 닉네임입니다</font>";			
		}else {
			msg="<font color=red>사용불가능한 닉네임입니다</font>";			
		}
		return msg;
	}
	
	@RequestMapping("checkEmail")
	public @ResponseBody String checkEmail(String Email) {
		System.out.println("checkemail"+Email);
		String msg;
		if(userdao.emailCheck(Email)==0) {
			msg="<font color=blue>사용가능한 이메일입니다</font>";	
		}else {
			msg="<font color=red>사용불가능한 이메일입니다</font>";				
		}
		
		return msg;
	}
	
	@RequestMapping("findPass")
	public String findPass() {
		
		return "main/findPass";
	}

	@RequestMapping("/searchKey")
	public String searchKeyword(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		List<Map<String, Object>> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "search/searchInputPartTest";
	}
	
	@RequestMapping("/searchButton")
	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
		System.out.println("키워드얌 검색창-->"+keyword);
		if(keyword.contains("#")) {
			m.addAttribute("keyword", keyword);
			return "search/searchResult";
		}else {
			
			if(!dao.searchName(keyword).isEmpty()&&!dao.searchTag(keyword).isEmpty()) {
			m.addAttribute("tagOrName", "both");
			m.addAttribute("input", keyword);
			return "search/searchResultAll";
			
			}else if(!dao.searchTag(keyword).isEmpty()&&dao.searchName(keyword).isEmpty()) {
			m.addAttribute("tagOrName", "tag");
			m.addAttribute("input", keyword);
			return "search/searchResultAll";
			
			}else if(!dao.searchName(keyword).isEmpty()&&dao.searchTag(keyword).isEmpty()) {
			System.out.println("dao.searchName(keyword)"+dao.searchName(keyword));
			m.addAttribute("tagOrName", "name");
			m.addAttribute("input", keyword);
			return "search/searchResultAll";	
			}
			return "search/searchResultAll";
		}
		
	}
	
	@RequestMapping("/searchTagBox")
	public String searchTagBox(Model m, String keyword) { //검색창에서 해시태그 연관검색어 가져오기
		List<String> list = dao.searchTag(keyword);
		m.addAttribute("list", list);
		m.addAttribute("keyword",keyword);
		return "search/searchTagBox";
	}
	
	@RequestMapping("/searchNameList")
	public String searchNameList(Model m, String input) { //검색시 제목에 검색어가 포함되어있을때
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
			list4.add(dao.searchNameList(input));
			for (int i = 0; i < list4.size(); i++) {
				for (int j = 0; j < list4.get(i).size(); j++) {
					Map<String,Object> map = list4.get(i).get(j);
					map.put("PFTHUMB",((String)map.get("PFTHUMB")).split("\\|")[0]);				
				}
			}
			m.addAttribute("list4", list4);
		return "search/searchNameResult";
	}

	@RequestMapping("/searchTagList")
	public String searchTagList(Model m, String input) {//검색시 태그에 검색어가 포함되어있을때
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
		list4.add(dao.searchTagList(input));
		for (int i = 0; i < list4.size(); i++) {
			for (int j = 0; j < list4.get(i).size(); j++) {
				Map<String,Object> map = list4.get(i).get(j);
				map.put("PFTHUMB",((String)map.get("PFTHUMB")).split("\\|")[0]);				
			}
		}
		m.addAttribute("list4", list4);
		return "search/searchTagResult";
	}
	
	@RequestMapping("/searchHashTagList")
	public String searchHashTagList(Model m, String keyword, int base) {//검색시 태그에 검색어가 포함되어있을때
			String[] keyword2 = keyword.split("#"); 
			List<Map<String, Object>> list=null;
			if(keyword2.length==2) {
				list = dao.searchHashResult(keyword2[1], base);
			}else {
				String keyword3 = keyword2[1];
				for (int i = 2; i < keyword2.length; i++) {
						keyword3 = keyword3 +"|"+ keyword2[i];
				}
				System.out.println("keyword33>>>"+keyword3);
				list = dao.searchHashResult(keyword3, base);
			}
			System.out.println("list 0903>>>"+ list);
			for (int i = 0; i < list.size(); i++) {
				Map<String,Object> map = list.get(i);
				map.put("PFTHUMB",((String)map.get("PFTHUMB")).split("\\|")[0]);
			}
			m.addAttribute("list", list);
		return "search/searchHashResult";
	}
	
	@RequestMapping("/searchHashClick")
	public String searchHashClick(Model m, String keyword) {//게시물에서 해시태그 클릭시
		m.addAttribute("HashTag", keyword);
		return "search/searchHashClick";
	}
	
	@RequestMapping("/searchHashClickContent")
	public String searchHashClickContent(Model m, String keyword, int base) {//게시물에서 해시태그 클릭시
		List<Map<String, Object>> list = dao.searchHashResult(keyword, base);
		for (int i = 0; i < list.size(); i++) {
			Map<String,Object> map = list.get(i);
			map.put("PFTHUMB",((String)map.get("PFTHUMB")).split("\\|")[0]);
		}
		m.addAttribute("list", list);
		m.addAttribute("HashTag", keyword);
		return "search/searchHashClickContent";
	}
	

	/*메인 popular*/
	@RequestMapping("/mainpopular")
	public String mainPopular(Model m) {
		List<Map> list = dao.mainPopular();
		m.addAttribute("list",list);
		return "portfolio/cardPost";
	}
	
	@RequestMapping("/mainrecent")
	public String mainRecent(Model m) {
		List<Map> list = dao.mainRecent();
		System.out.println(list);
		m.addAttribute("list",list);
		return "portfolio/cardPost";
	}
}
