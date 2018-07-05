package kr.green.springwebproject.controller;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;
import kr.green.springwebproject.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	
	private JavaMailSender mailSender;
	@Autowired
	private UserService userService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
				
		return "home";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String homePost(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		User user;
		
		if( (user = userService.login(id, pw)) != null) {
			//로그인 인터셉터 에게 보낼 유저정보
			model.addAttribute("user", user);
			return "redirect:/board/list";
		}
		
		return "redirect:/";
	}
	@RequestMapping(value ="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/";
	}
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signupGet(HttpServletRequest request) {
		return "signup";
	}
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPost(HttpServletRequest request, User user) {
		if(!userService.signUp(user))
			return "redirect:/signup";
		else {
			return "redirect:/";
		}
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String ModifyGet(HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();
		User nowUser = (User)session.getAttribute("user");
		model.addAttribute("nowUser", nowUser);
		return "modify"; 
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String ModifyPost(HttpServletRequest request,
			Model model, User user) {
		HttpSession session = request.getSession();
		User nowUser = (User)session.getAttribute("user");
		//user의 정보를 이용해서 UserMapper에 있는 xxx메소드를 호출
		
		//하여 db의 정보를 수정
		user = userService.modify(nowUser, user);
		if(user !=null) {
		session.removeAttribute("user");
		session.setAttribute("user", user);
	}
		return "redirect:/board/list";
}
	
	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {

	    String setfrom = "stajun@naver.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용

	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(new InternetAddress(setfrom));  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(tomail);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        messageHelper.setText(content);  // 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }

	    return "redirect:/mail/mailForm";
	}
	@RequestMapping(value="/member/withdraw")
	public String withdraw(HttpServletRequest r) {
		HttpSession session = r.getSession();
		User user = (User)session.getAttribute("user");
		
		userService.withdreaw(user);
		
		
		return "redirect:/logout";
	}
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() {
		return "test";
	}
	@ResponseBody
	@RequestMapping(value="/test", method=RequestMethod.POST,
		produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> testPost(MultipartFile file) {
		return new ResponseEntity<String>(file.getOriginalFilename(),
				HttpStatus.OK);
	}
}








