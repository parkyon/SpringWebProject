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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.RecBookReview;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.service.RecBookReviewService;
import kr.green.springwebproject.service.RecBookService;
import kr.green.springwebproject.service.UserService;
import kr.green.springwebproject.utils.MediaUtils;
import kr.green.springwebproject.utils.UploadFileUtils;

@Controller
@RequestMapping(value="/recBook/*")
public class RecBookController {
	@Autowired
	private UserService userService;
	@Autowired
	private RecBookService recBookService;
	@Autowired
	private RecBookReviewService recBookReviewService;
	@Resource
	private String uploadPath;
	
	
	@RequestMapping(value="/recBookMain",method = RequestMethod.GET)
	public String recBookListMainGet(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		return "recBook/recBookMain";
	}
	@RequestMapping(value = "/recBookList", method = RequestMethod.GET)
	public String recBookListGet(Model model, HttpServletRequest request, Integer recBookNumber, RecBook recBook, RecBookReview recbookreview) {
		
		
		recBookService.RecBookGuestReview(recBook, recbookreview);
		
		if(recBookNumber == null) {
			recBookNumber = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<RecBook> list = recBookService.getRecBook(recBookNumber);
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "recBook/recBookList";
	}
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String recBookDetail(HttpServletRequest request,
			Model model, Integer recBookNumber, RecBookReview recBookReview) {
		
		
		if(recBookNumber == null) {
			recBookNumber = 1;
		}
	
		RecBook recBook = recBookService.getDetailRecBook(recBookNumber);
		recBookService.RecBookHits(recBook);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = recBookService.isAuthor(user, recBook);
	
		ArrayList<RecBookReview> list = recBookReviewService.GetReview(recBook, recBookReview);
		
		int totalCount = recBookReviewService.CountReview(recBook, recBookReview);
		
		model.addAttribute("totalCount", totalCount);
		
		model.addAttribute("list", list);
		System.out.println("이것은 리스트");
		System.out.println(list);
		
		
		String filepath = recBook.getFilepath();
		if(filepath != null) {
		//filepath : /�뀈/�썡/�씪/uuid_�뙆�씪紐�
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		
		model.addAttribute("filepath", filepath);
		
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("recBook", recBook);		
		
		//댓글용
		
		
		
		return "/recBook/detail";
	}
	
	@RequestMapping(value ="detail", method = RequestMethod.POST)
	public String DPOST(LibraryInfo libraryInfo
			,HttpServletRequest request,  String content, Model model, RecBook recBook, RecBookReview recbookreview, Integer bno, Integer recviewnumber, RecBookReview recbookReview) throws Exception {
		
		String rec = (String) request.getParameter("recBookNumber");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		recBookReviewService.InsertReview(user, recBook, recbookreview);
		
	
		model.addAttribute("recBookNumber", recBook.getRecBookNumber());
		
		
		
	return "redirect:/recBook/detail";
	}
	@RequestMapping(value ="register", method = RequestMethod.GET)
	public String recBookRegisterGet() {
		
		
		return "/recBook/register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String boardRegisterPost(RecBook recBook
			,HttpServletRequest request, MultipartFile file, Integer recviewnumber, RecBookReview recbookReview) throws Exception {
	
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		
		recBookService.registerRecBook(recBook, user, file, uploadPath);
		
	
		return "redirect:/recBook/recBookList";
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
	
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<String> displayFile(MultipartFile file)
			throws Exception{
		String fileName = UploadFileUtils.uploadFile
				(uploadPath, file.getOriginalFilename(),file.getBytes());
	    
	    return new ResponseEntity<String>(fileName,
				HttpStatus.OK);
	}
	
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String recBookModifyGet(HttpServletRequest request,
			Model model,Integer del, Integer recBookNumber) {
				
		RecBook recBook = recBookService.getDetailRecBook(recBookNumber);
		if(del != null && del == 1) {
			//db遺덈윭�삩 寃뚯떆�뙋�쓽 �젙蹂댁뿉�꽌 �뾽濡쒕뱶 �뙆�씪 寃쎈줈瑜� 吏���
			//db�뿉�꽌�뒗 吏��슦吏� �븡�쓬
			recBook.setFilepath(null);
		}
		
		
		model.addAttribute("recBook", recBook);
	
		//파일명 수정하는 과정
		
		
		//�뙆�씪紐� �닔�젙�븯�뒗 怨쇱젙
		String filepath = recBook.getFilepath();
		if(filepath != null) {
		//filepath : /�뀈/�썡/�씪/uuid_�뙆�씪紐�
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		return "/recBook/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String recBookModifyPost(HttpServletRequest request,
			Model model, RecBook recBook, MultipartFile file, Integer del) 
					throws Exception {
		
		recBookService.modifyRecBook(recBook, file, uploadPath, del);
		System.out.println("RECBOOK");
		System.out.println(recBook.getWriter());
		
		return "redirect:/recBook/recBookList";
	}
	@RequestMapping(value="/delete")
	public String deleteRecBook(Integer recBookNumber ,RecBook recBook) {
		recBookService.DeleteRecBook(recBookNumber, recBook);
		return "redirect:/recBook/recBookList";
	}
	
	
	
	
	//최신글 5개
	
	
	@RequestMapping(value="recentlyRecBookList")
	public String recntlyRecBook(Model model, HttpServletRequest request, Integer recBookNumber ,Criteria cri
			,String search, Integer type) {
int totalCount1 = recBookService.getCountByRecBookList(type, search, cri);
		
		ArrayList<RecBook> list1 =recBookService.getRecBook(type,search,cri);
		
		model.addAttribute("list1", list1);
		
		return "/recBook/recentlyRecBookList";
	}
	
	
	//좋아요 싫어요
	
	@RequestMapping(value="rec")
	public String recRecBook(RecBook recBook) {
		recBookService.RecRecBook(recBook);
		return "redirect:/recBook/recBookList";
	}
	
	@RequestMapping(value="notrec")
	public String notrecRecBook(RecBook recBook) {
		recBookService.NotRecBook(recBook);
		return "redirect:/recBook/recBookList";
	}
	
	
	@RequestMapping(value="contentDelete")
	public String ContentDelete(Integer recviewnumber, RecBook recBook, RecBookReview recbookReview) {
		recBookReviewService.deleteReview(recviewnumber, recBook, recbookReview);
		System.out.println("recviewnumber");
		
		return "redirect:/recBook/recBookList";
	}
	

	
	@RequestMapping(value="contentModify" , method=RequestMethod.POST)
	public String ContentModifyPOST(HttpServletRequest request, Integer recviewnumber, RecBook recBook, RecBookReview recbookReview, String content1) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		
		recbookReview.setContent(content1);
		recBookReviewService.modifyReview(recviewnumber, recBook, recbookReview, user);
		return "redirect:/recBook/recBookList";
	}
	
	@RequestMapping(value="loginHomeRecBook")
	public String loginHomeRecBookGet(Integer recviewnumber, RecBook recBook, RecBookReview recbookReview) {
		
		
		return "/recBook/loginHomeRecBook";
	}
	
	//이번달 추천도서
	
	@RequestMapping(value = "/thisRecBook", method = RequestMethod.GET)
	public String thisRecBookGet(Model model, HttpServletRequest request, Integer recBookNumber, RecBook recBook, RecBookReview recbookreview) {
		
		
		recBookService.RecBookGuestReview(recBook, recbookreview);
		
		if(recBookNumber == null) {
			recBookNumber = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<RecBook> list = recBookService.ThisRecBook(recBook);
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "recBook/thisRecBook";
	}
	
	@RequestMapping(value="/searchRecBook", method = RequestMethod.GET)
	public String searchRecBook(Integer type, String search, HttpServletRequest request, Model model) {
		ArrayList<RecBook> list = recBookService.LM_RecBook(type, search);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = userService.isAdmin(user);
		
		model.addAttribute("list", list);
		System.out.println("리스트"+list);
		model.addAttribute("search", search);
		
		System.out.println("서치"+search);
		model.addAttribute("type", type);
		model.addAttribute("admin", admin);
		
		
		return "recBook/searchRecBook";
	}
}


