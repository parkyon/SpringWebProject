package kr.green.springwebproject.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] 	
			fileData)throws Exception{
		UUID uid = UUID.randomUUID(); //동일한 파일을 업로드를 했을때 구분하기 위한 고유 범용 식별자를 생성
		
		String savedName = uid.toString() +"_" + originalName;  //서버에 저장할 파일 이름을 설정한다 고유범용식별자_파일명 으로 한다.
		String savedPath = calcPath(uploadPath);  //서버에 지정한 폴더에 저장하기 위해 만든 폴더(하위폴더)경로
		//하위폴더가 없으면 서버에 지정한 폴더에 많은 파일들이 업로드되어 성능저하가 일어남, 따라서 하위 폴더를 생성해서 파일들ㅇ르 분할하여ㅑ 관리 
		
		File target = new File(uploadPath + savedPath, savedName);//서버경로/일폴더경로/파일생성
		FileCopyUtils.copy(fileData, target);//c:\git=uploadfiles\index.heml
		String uploadFileName = makeIcon(uploadPath, savedPath, savedName);
		return uploadFileName;
	}
	
	private static String calcPath(String uploadPath) {
		//폴더의 경로를 정함
		Calendar cal = Calendar.getInstance();
		//날짜값을 가져온다.
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);//file.separator : \\
		String monthPath = yearPath + File.separator 
				//file.separator을 구분자
            + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		//월값을 0+1부터 받아와서 00 에 맞쳐서 가져온다.
		String datePath = monthPath + File.separator 
            + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);
		//폴더 생성
		
		return datePath;
 
	}
	private static void makeDir(String uploadPath, String... paths) {
		//알폴더를 이용하여 서버경로 + 일폴더 경로를 하친 경로를 생성학,생성된  경로가 존재하면 작어븡 할 필요가 없음
		//String...paths 여러개의 문자열이 들어온다 몇개인지는 모른다.
		if(new File(paths[paths.length-1]).exists())
			return;
		//매개변수에서 입력받은 경로들을 하나씩 가져와서 해당경로에 폴더가 있는지 없는지 확인하여 있으면 그냥 넘어가고 없으면 폴드를 생성
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if( !dirPath.exists())
				dirPath.mkdir();
		}
	}
	private static String makeIcon(String uploadPath, String path, String fileName)
        	throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		//풀경로(서버경로\폴덜경로\파일명에서 서버경로를 제외한 경로로를 추출
		// 폴더경호\v파일명
		//.replace(file.separatorChar . '/' ): 폴더경로 \파일명
		//폴더경로 /파일명으로 수정)
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		//역슬래쉬 두개를 슬래쉬로 변경시켜준다. 
	}
};