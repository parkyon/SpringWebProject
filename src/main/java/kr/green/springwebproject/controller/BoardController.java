package kr.green.springwebproject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.utils.UploadFileUtils;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Resource
	private String uploadPath;
	
	@RequestMapping(value="list")
	public String boardList(Model model,Criteria cri
			,String search, Integer type,HttpServletRequest request) {
		//Criteria cri = new Criteria(1,5);
		if(cri == null) {
			cri = new Criteria();
		}
		int totalCount=0;
		PageMaker pageMaker = new PageMaker();
		ArrayList<Board> list=null;
		pageMaker.setCriteria(cri);
		
		if(type == null)
			type = 0;
		if(type == 0) {
			totalCount = boardMapper.getCountBoard();
			list 
			= (ArrayList)boardMapper.getListPage(cri);
		}
		else if(type == 1) {
			totalCount 
			= boardMapper.getCountBoardByTitle("%"+search+"%");
			list 
			= (ArrayList)boardMapper.getListPageByTitle(cri,"%"+search+"%");
		}else if(type == 2) {
			totalCount 
			= boardMapper.getCountBoardByAuthor("%"+search+"%");
			list 
			= (ArrayList)boardMapper.getListPageByAuthor(cri,"%"+search+"%");
		}else {
			totalCount 
			= boardMapper.getCountBoardByContents("%"+search+"%");
			list 
			= (ArrayList)boardMapper.getListPageByContents(cri,"%"+search+"%");
		}
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = false;
		boolean superadmin = false;
		if(user.getAdmin().compareTo("ADMIN")==0)
			//if(user.getAdmin().compareTo("USER")!=0) 으로만 하고 밑에 superadmin은 지줘도 된다
			admin = true;
		
		if(user.getAdmin().compareTo("SUPERADMIN")==0)
				superadmin=true;
		model.addAttribute("admin", admin);
		model.addAttribute("superadmin", superadmin);
		
		
		
		
		return "/board/list";
	}
	@RequestMapping(value="detail")
	public String boardDetail(HttpServletRequest request,
			Model model) {
		int number = 
			Integer.parseInt(request.getParameter("number"));
		
		Board board = boardMapper.getBoardByNumber(number);
		model.addAttribute("board", board);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = false;
		if(user != null) {
			if(user.getId().compareTo(board.getAuthor())==0)
				isAuthor = true;
			else 
				isAuthor = false;
		}
		model.addAttribute("isAuthor", isAuthor);
		return "/board/detail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String boardModifyGet(HttpServletRequest request,
			Model model) {
		int number = 
				Integer.parseInt(request.getParameter("number"));
			
		Board board = boardMapper.getBoardByNumber(number);
		model.addAttribute("board", board);
		
		return "/board/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String boardModifyPost(HttpServletRequest request,
			Model model, Board board) {
		
		boardMapper.modifyBoard(board);
		
		return "redirect:/board/list";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String boardRegisterGet() {
		return "/board/register";
	}
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String boardRegisterPost(Board board
			,HttpServletRequest request, MultipartFile file) throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		board.setAuthor(user.getId());
		boardMapper.insertBoard(board);
		
		UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
		return "redirect:/board/list";
		
		
	
	}
	@RequestMapping(value="/myboards")
	public String myBoards(Model model,Criteria cri
			,HttpServletRequest request) {
		if(cri == null) {
			cri = new Criteria();
		}
		int totalCount=0;
		PageMaker pageMaker = new PageMaker();
		ArrayList<Board> list=null;
		pageMaker.setCriteria(cri);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String author = user.getId();
		
		totalCount = boardMapper.getCountMyBoards(author);
		list = (ArrayList)boardMapper.getMyBoards(author, cri);
		
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
	
		boolean admin = false;
		if(user.getAdmin().compareTo("ADMIN")==0)
			admin = true;
		model.addAttribute("admin", admin);
		
		
		
		return "/board/myboards";
	}
	
	
	private String uploadFile(String name, byte[] data)
			throws Exception{
		    /* 고유한 파일명을 위해 UUID를 이용 */
			UUID uid = UUID.randomUUID();
			String savaName = uid.toString() + "_" + name;
			File target = new File(uploadPath, savaName);
			FileCopyUtils.copy(data, target);
			return savaName;
		}
	
	
	@ResponseBody
	@RequestMapping("download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
		//ResponseEntity<byte[]> 바든거 그대로 전송
	    InputStream in = null;  //input과 관련된거 처리
	    ResponseEntity<byte[]> entity = null;
	    try{
	        String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        //확장자 기준(.)으로 확장자 채집
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        //
	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	    	//예외가 발생하든 아니든 실행
	        in.close();
	    }
	    return entity;
	}
}