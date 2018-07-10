package kr.green.springwebproject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.BoardService;
import kr.green.springwebproject.service.UserService;
import kr.green.springwebproject.utils.MediaUtils;
import kr.green.springwebproject.utils.UploadFileUtils;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Resource
	private String uploadPath;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="list")
	public String boardList(Model model,Criteria cri
			,String search, Integer type,HttpServletRequest request) {
		//Criteria cri = new Criteria(1,5);
		if(cri == null) 
			cri = new Criteria();
		
		PageMaker pageMaker = new PageMaker();
		int totalCount = boardService.getCountByBoardList(type, cri, search);
		ArrayList<Board> list = boardService.getListBoard(type, cri, search);

		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		model.addAttribute("admin", admin);
		
		return "/board/list";
	}
	@RequestMapping(value="detail")
	public String boardDetail(HttpServletRequest request,
			Model model, int number) {
		
		Board board = boardService.getBoard(number);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = boardService.isAuthor(user, board);
		
		//파일명 수정하는 과정
		String filepath = board.getFilepath();
		if(filepath != null) {
		//filepath : /년/월/일/uuid_파일명
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("board", board);		
		return "/board/detail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String boardModifyGet(HttpServletRequest request,
			Model model,Integer del, Integer number) {
				
		Board board = boardService.getBoard(number);
		if(del != null && del == 1) {
			//db불러온 게시판의 정보에서 업로드 파일 경로를 지움
			//db에서는 지우지 않음
			board.setFilepath(null);
		}
		model.addAttribute("board", board);
		//파일명 수정하는 과정
		String filepath = board.getFilepath();
		if(filepath != null) {
		//filepath : /년/월/일/uuid_파일명
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		return "/board/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String boardModifyPost(HttpServletRequest request,
			Model model, Board board, MultipartFile file, Integer del) 
			throws Exception {
		
		boardService.modifyBoard(board, file, uploadPath, del);
		
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
		boardService.registerBoard(board, user, file, uploadPath);
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
		
		list = boardService.getListBoard(2, cri, user.getId());
		totalCount = boardService.getCountByBoardList(2, cri, user.getId());
		
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
	
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		return "/board/myboards";
	}
	@ResponseBody
	@RequestMapping("download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	    	String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        /*	확장자를 통해 미디어 타입 정보를 가져옴*/
	        MediaType mType = MediaUtils.getMediaType(FormatName);
	        
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        
	        /*	이미지이면 */
	        if(mType != null) {
	        	headers.setContentType(mType);
	        }else {
	        	fileName = fileName.substring(fileName.indexOf("_")+1);
		        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		        headers.add("Content-Disposition",  "attachment; filename=\"" 
					+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        }
	        entity = new ResponseEntity<byte[]>(
	        		IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	@RequestMapping(value="/delete")
	public String delete(Integer number) {
		boardService.deleteBoard(number);
		return "redirect:/board/list";
	}
	/*	썸네일을 가져오기위해 서버에 일단 파일을 업로드하여 섬네일을 생성
	 * 	(UploadFileUtils.uploadFile)하고 생성된 썸네일의 경로및 이름을 가져옴
	 * 	(return)	
	 * */
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<String> displayFile(MultipartFile file)
			throws Exception{
		String fileName = UploadFileUtils.uploadFile
				(uploadPath, file.getOriginalFilename(),file.getBytes());
	    
	    return new ResponseEntity<String>(fileName,
				HttpStatus.OK);
	}
	
}






