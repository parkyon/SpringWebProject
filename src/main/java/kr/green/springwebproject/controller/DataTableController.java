package kr.green.springwebproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.service.LibraryInfoService;
import kr.green.springwebproject.service.UserService;

@Controller	
public class DataTableController {

	@Autowired
	private LibraryInfoService libraryInfoService;
	@Resource
	private String uploadPat;
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value = "/dataTable.do")
	public String recentlyLibraryInfo(Model model, HttpServletRequest request, Integer number ,Criteria cri
			,String search, Integer type) {
		int totalCount2 = libraryInfoService.getCountByLibraryInfoList(type, search, cri);
		ArrayList<LibraryInfo> list2 = libraryInfoService.getListLibraryInfo(type, search, cri);
		model.addAttribute("list2", list2);
	  return "list";
	 }
	
	
	@RequestMapping(value = "/ajax.do")
	 public @ResponseBody Map<String, Object> ajax(ServletRequest req) throws Exception 
	{
		//검색 반환을 위한
		 Map<String, Object> mapReturn = new HashMap<String, Object>();
		// 데이터 검색을 위한
		 Map<String, Object> mapSearch = new HashMap<String, Object>();
		 
		 //검색 결과 보관을 위한
		 List listData = new ArrayList();
		 //검색 결과 보관을 위한
		
		
		 // 컬러명 수집
		 List<String> listColumns = new ArrayList<String>();
		 for(int i=0; ;i++)
		 {
			 String colName = req.getParameter("columns["+i+"][data]");
			 if (colName != null && colName.length() > 0)
			 {
				 listColumns.add(colName);
			 }
			 else
			 {
				 break;
			 }
		 }
		 //기타 데이터 수집
		 String sDraw = req.getParameter("draw");
		 String sLength = req.getParameter("length");
		 String sStart = req.getParameter("start");
		 String sTable = req.getParameter("table");
		 String sOrderColumn = req.getParameter("order[0][column]");
		 String sOrderDir = req.getParameter("order[0][dir]");
		 String sSearch = req.getParameter("search[value]");
		 
		int nStart = 01;
		int nLength = 10;
		
		try{
			nStart = Integer.parseInt(sStart);
			
		}
		catch(NumberFormatException e){}
		
		try{
			nLength = Integer.parseInt(sLength);
			
		}
		catch(NumberFormatException e){}
		
			
		
		
		
		 //검색컬럼명
		 int nOrderColumn = 0;
		 String sOrderColumnName = null;
		 
		 try{
			 nOrderColumn = Integer.parseInt(sOrderColumn);
		 }
		 catch(NumberFormatException e)
		 {
			 nOrderColumn = 0;
		 }
		
		
		 if (nOrderColumn >= 0 && nOrderColumn < listColumns.size())
		 {
			 sOrderColumnName = listColumns.get(nOrderColumn);
		 }
		 
		 //검색 데이터 구성
		 mapSearch.put("sTable", sTable);
		 mapSearch.put("nStart", nStart);
		 mapSearch.put("nLength", nLength);
		 mapSearch.put("sSearch", sSearch);
		 mapSearch.put("sOrderDir", sOrderDir);
		 mapSearch.put("sOrderColumnName", sOrderColumnName);
		 mapSearch.put("listColumns", listColumns);
		 
		 
		
	
		Integer type = null;
		String search = null;
		Criteria cri = null;
		// 데이터 검색 처리
		 listData = libraryInfoService.SSgetLibraryInfo(type, search, cri);
		 //전체 데이터 개수 처리
		
		int aaa = 0;
		int nRecordTotal = libraryInfoService.CountLibrary(type, search, cri, aaa);
		 
		 //임시 - 파라메터 출력
		 dispParams(req);
		
		//변환 데이터 구성
		mapReturn.put("draw", sDraw);
		mapReturn.put("recordsTotal", nRecordTotal);
		mapReturn.put("recordsFiltered",nRecordTotal);
		mapReturn.put("data",listData);
		
		
	
	  return mapReturn;
	 }
	
	private void dispParams(ServletRequest req)
	{
		Map<String, String[]> map = req.getParameterMap();
		SortedSet<String> set = new TreeSet<String>();
		set.addAll(map.keySet());
		
		for(String key : set)
		{
			String[] values = map.get(key);
			System.out.print(key);
			System.out.print(" : ");
			for(String value : values)
			{
				if (value != null)
				{
					System.out.print(value);
					System.out.print(",");
				}
			}
			System.out.println();
		}
	}
}
