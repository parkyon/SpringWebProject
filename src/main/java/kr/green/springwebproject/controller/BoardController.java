package kr.green.springwebproject.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;

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
import kr.green.springwebproject.dao.BoardComment;
import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.BoardCommentService;
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
	@Autowired
	private BoardCommentService boardCommentService;
	
	@RequestMapping(value="boardMain",method = RequestMethod.GET)
	public String boardMainGet(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		return "board/boardMain";
	}
	@RequestMapping(value="list")
	public String boardList(Model model,Criteria cri
			,String search, Integer type,HttpServletRequest request, Board board, BoardComment boardComment) {
		//Criteria cri = new Criteria(1,5);
		if(cri == null) 
			cri = new Criteria();
		
		boardService.BoardMainReview(board, boardComment);
		
		int totalCount = boardService.getCountByBoardList(type, cri, search);
		ArrayList<Board> list = boardService.getListBoard(type, cri, search);

	
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		
		model.addAttribute("list",list);
	
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		model.addAttribute("admin", admin);
		System.out.println(list);
		return "/board/list";
	}
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String boardDetail(HttpServletRequest request,
			Model model, int number, BoardComment boardComment) {
		
		Board board = boardService.getBoard(number);
		boardService.BoardHits(board);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = boardService.isAuthor(user, board);
		
	
		ArrayList<BoardComment> list = boardCommentService.GetBoardComment(board, boardComment);
		model.addAttribute("list", list);
		System.out.println("이것은 댓글 리스트");
		System.out.println(list);
		
		int totalCount = boardCommentService.CountComment(boardComment, board);
		model.addAttribute("totalCount", totalCount);
		
		//�뙆�씪紐� �닔�젙�븯�뒗 怨쇱젙
		String filepath = board.getFilepath();
		if(filepath != null) {
		//filepath : /�뀈/�썡/�씪/uuid_�뙆�씪紐�
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("board", board);		
		return "/board/detail";
	}
	
	
	@RequestMapping(value="detail", method=RequestMethod.POST)
	public String detailPost(Board board, BoardComment boardComment, HttpServletRequest request, Model model)throws Exception {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boardCommentService.InsertBoardComment(user, board, boardComment);
		
		model.addAttribute("number",board.getNumber());
		
		
		return "redirect:/board/detail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String boardModifyGet(HttpServletRequest request,
			Model model,Integer del, Integer number) {
				
		Board board = boardService.getBoard(number);
		if(del != null && del == 1) {
			//db遺덈윭�삩 寃뚯떆�뙋�쓽 �젙蹂댁뿉�꽌 �뾽濡쒕뱶 �뙆�씪 寃쎈줈瑜� 吏���
			//db�뿉�꽌�뒗 吏��슦吏� �븡�쓬
			board.setFilepath(null);
		}
		model.addAttribute("board", board);
		//�뙆�씪紐� �닔�젙�븯�뒗 怨쇱젙
		String filepath = board.getFilepath();
		if(filepath != null) {
		//filepath : /�뀈/�썡/�씪/uuid_�뙆�씪紐�
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
	        /*	�솗�옣�옄瑜� �넻�빐 誘몃뵒�뼱 ���엯 �젙蹂대�� 媛��졇�샂*/
	        MediaType mType = MediaUtils.getMediaType(FormatName);
	        
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        
	        /*	�씠誘몄��씠硫� */
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
	public String delete(Integer number, Board board) {
		boardService.deleteBoard(number, board);
		return "redirect:/board/list";
	}
	/*	�뜽�꽕�씪�쓣 媛��졇�삤湲곗쐞�빐 �꽌踰꾩뿉 �씪�떒 �뙆�씪�쓣 �뾽濡쒕뱶�븯�뿬 �꽟�꽕�씪�쓣 �깮�꽦
	 * 	(UploadFileUtils.uploadFile)�븯怨� �깮�꽦�맂 �뜽�꽕�씪�쓽 寃쎈줈諛� �씠由꾩쓣 媛��졇�샂
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
	
	
	
	//최신글 5개
	
	@RequestMapping(value = "/recentlyBoard", method = RequestMethod.GET)
	public String recentlyBoard(Model model, HttpServletRequest request, Integer number ,Criteria cri
			,String search, Integer type) {
		
		if(number == null) {
			number = 1;
		}
		if(cri == null) {
			cri = new Criteria();
		}
		//자유게시판 최신글
		PageMaker pageMaker = new PageMaker();
		int totalCount = boardService.getCountByBoardList(type, search, cri);
		ArrayList<Board> list = boardService.getListBoard(type, search, cri);

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
		
		System.out.println(list);
		
		return "/board/recentlyBoard";
}
	
	
	@RequestMapping(value="notice", method = RequestMethod.GET)
	public String notice(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		return "/board/notice";
	}
	
	
	
	
	@RequestMapping(value="event", method = RequestMethod.GET)
	public String event(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		return "/board/event";
	}
	
	
	
	
	
	
	//좋아요 싫어요
	
		@RequestMapping(value="rec")
		public String RecBoard(Board board) {
			boardService.Recboard(board);
			System.out.println("board");
			System.out.println(board.getRecomand());
			return "redirect:/board/list";
		}
		
		@RequestMapping(value="notrec")
		public String NotRecBoard(Board board) {
			boardService.RecNotboard(board);
			return "redirect:/board/list";
		}
	
	
	//댓글 수정/삭제
		
	@RequestMapping(value="commentDelete")
	public String CommentDelete(Integer cno, Board board, BoardComment boardComment ) {
		boardCommentService.DeleteBoardComment(cno, boardComment, board);
		
		return "redirect:/board/list";
	}
	
	
	@RequestMapping(value="commentModify")
	public String CommentModify(Integer cno, Board board, BoardComment boardComment, String content1 ) {
		boardComment.setContent(content1);
		boardCommentService.modifyBoardComment(cno, boardComment, board);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/searchBoard", method = RequestMethod.GET)
	public String searchBoard(Integer type, String search, HttpServletRequest request, Model model) {
		ArrayList<Board> list = boardService.LM_Board(search, type);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = userService.isAdmin(user);
		
		model.addAttribute("list", list);
		System.out.println("리스트"+list);
		model.addAttribute("search", search);
		
		System.out.println("서치"+search);
		model.addAttribute("type", type);
		model.addAttribute("admin", admin);
		
		
		return "board/searchBoard";
	}
	
}








