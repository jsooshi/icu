package com.porget.control;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.porget.domain.PortfolioVO;
import com.porget.domain.RecruiterVO;
import com.porget.domain.UserVO;
import com.porget.persistence.PortfolioDAO;
import com.porget.persistence.RecruiterDAO;
import com.porget.persistence.UserDAO;

@Controller
public class MainController {
	
	@Autowired
	private PortfolioDAO dao;
	
	@Autowired
	private UserDAO userdao;
	
	@Autowired
	private RecruiterDAO recruiterdao;

	@GetMapping("/")
	public String index() {
		return "main/index";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)//메인폼에서 회원가입누르면 리크루터 구직자 선택
	public String userJoinForm() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value = "/userjoin", method = RequestMethod.GET)//구직자 회원가입 폼
	public String insertUser() {
		
		return "member/userJoin";
	}
	
	@RequestMapping(value = "/userjoin", method = RequestMethod.POST)//구직자 DB 회원가입 
	public String userJoin(UserVO vo, HttpServletResponse response) throws Exception {
		System.out.println("구직자 회원가입vo="+vo);
		userdao.insert(vo);//DB입력요청
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		response.getWriter().print("<script>alert('회원가입을 축하드립니다.');</script>");
		out.flush();
		return "main/index";
	}
	
	@RequestMapping(value = "/recrujoin", method = RequestMethod.GET)//리쿠르터 회원가입 폼
	public String recruitjJinForm() {
		
		return "member/recruiterJoin";
	}
	
	@RequestMapping(value = "/recrujoin", method = RequestMethod.POST)//리쿠르터 DB 회원가입 
	public String insertRecruit(RecruiterVO rvo, HttpServletResponse response) throws Exception {
		System.out.println("리크루터 회원가입vo="+rvo);
		recruiterdao.insert(rvo);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		response.getWriter().print("<script>alert('회원가입을 축하드립니다.');</script>");
		out.flush();
		return "main/index";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)//로그인창 보여주기
	public String login() {
		
		return "main/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSuccess(UserVO vo, HttpSession session, HttpServletResponse response) throws Exception {//로그인시 세션 저장
		String uname = userdao.login(vo);
		if(uname != null) {
			session.setAttribute("uname",uname);
			System.out.println("성공");
			return "redirect:/";
		}else {
			System.out.println("실패");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			response.getWriter().print("<script>alert('이메일과 비밀번호를 확인해주세요');</script>");
			out.flush();
			return "/main/login";
		}
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
	
	@RequestMapping("checkCname")
	public @ResponseBody String checkCname(String companyName) {
		System.out.println("checkcname>>"+companyName);
		String msg;
		if(recruiterdao.cidCheck(companyName)==0) {
			msg="<font color=blue>사용가능한 회사명입니다</font>";
		}else {
			msg="<font color=red>사용불가능한 회사명입니다</font>";	
		}
		return msg;
	}
	
	@RequestMapping("checkCemail")
	public @ResponseBody String checkCemail(String companyEmail) {
		System.out.println("checkcname>>"+companyEmail);
		String msg;
		if(recruiterdao.cemailCheck(companyEmail)==0) {
			msg="<font color=blue>사용가능한 이메일입니다</font>";
		}else {
			msg="<font color=red>사용불가능한 이메일입니다</font>";	
		}
		return msg;
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		
		return "main/myPage";
	}

	
	@RequestMapping("/searchKey")
	public String searchKeyword(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		List<Map<String, Object>> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchInputPartTest";
	}
	
	@RequestMapping("/searchButton")
	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
		System.out.println("키워드얌 검색창-->"+keyword);
		if(keyword.contains("#")) {
			m.addAttribute("keyword", keyword);
			return "portfolio/searchResult";
		}else {
			
			if(!dao.searchName(keyword).isEmpty()&&!dao.searchTag(keyword).isEmpty()) {
			m.addAttribute("tagOrName", "both");
			m.addAttribute("input", keyword);
			return "portfolio/searchResultAll";
			
			}else if(!dao.searchTag(keyword).isEmpty()&&dao.searchName(keyword).isEmpty()) {
			m.addAttribute("tagOrName", "tag");
			m.addAttribute("input", keyword);
			return "portfolio/searchResultAll";
			
			}else if(!dao.searchName(keyword).isEmpty()&&dao.searchTag(keyword).isEmpty()) {
			System.out.println("dao.searchName(keyword)"+dao.searchName(keyword));
			m.addAttribute("tagOrName", "name");
			m.addAttribute("input", keyword);
			return "portfolio/searchResultAll";	
			}
			return "portfolio/searchResultAll";
		}
		
	}
	
	@RequestMapping("/searchTagBox")
	public String searchTagBox(Model m, String keyword) { //검색창에서 해시태그 연관검색어 가져오기
		List<String> list = dao.searchTag(keyword);
		m.addAttribute("list", list);
		m.addAttribute("keyword",keyword);
		return "portfolio/searchTagBox";
	}
	
	@RequestMapping("/searchNameList")
	public String searchNameList(Model m, String input) { //검색시 제목에 검색어가 포함되어있을때
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
			list4.add(dao.searchNameList(input));
			m.addAttribute("list4", list4);
		return "portfolio/searchNameResult";
	}

	@RequestMapping("/searchTagList")
	public String searchTagList(Model m, String input) {//검색시 태그에 검색어가 포함되어있을때
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
		list4.add(dao.searchTagList(input));
		m.addAttribute("list4", list4);
		return "portfolio/searchTagResult";
	}
	
	@RequestMapping("/searchHashTagList")
	public String searchHashTagList(Model m, String keyword, int base) {//검색시 태그에 검색어가 포함되어있을때
			String[] keyword2 = keyword.split("#"); 
			List<Map<String, Object>> list=null;
			if(keyword2.length==2) {
				list = dao.searchHashResult(keyword2[1], base);
			}else {
				String keyword3 = null;
				for (int i = 0; i < keyword2.length; i++) {
					for (int j = i+1; j < keyword2.length; j++) {
						keyword3 = keyword2[i]+"|"+keyword2[j];
					}
				}
				System.out.println("keyword33>>>"+keyword3);
				list = dao.searchHashResult(keyword3, base);
			}
			System.out.println("list 0903>>>"+ list);
			m.addAttribute("list", list);
		return "portfolio/searchHashResult";
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
