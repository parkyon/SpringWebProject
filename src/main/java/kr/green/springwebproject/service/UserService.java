package kr.green.springwebproject.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;


@Service
public class UserService {
//회원 가입 할 경우 있으면 회원가입X 없으면 회원가입 하게 해주는 역활을 대신하게 해준다.
	//회원가입 페이지에서 입력받은 유저 정보를 입력받아 회원가입이 진행됬으면 true반환 아니면 false를 반환한다 
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	public boolean signUp(User user) {
		User searchUser = 
				userMapper.login(user.getId(), user.getPw());
		
		if(searchUser != null)
			return false;
		else {
			String encPw = passwordEncoder.encode(user.getPw());
			user.setPw(encPw);
			user.setAdmin("USER");
			userMapper.signup(user);
			return true;
		}
		
	
	}
		//유저 삭제
	public boolean DeleteUser(String id, User user) {
		userMapper.deleteUser(user, id);
		return true;
	}


	public User login(String id, String pw) {
		
		User user = userMapper.loginById(id);
		
		if(user != null && passwordEncoder.matches(pw, user.getPw())) {
			
			return user;
		}
			else
				return null;
	
	
		}
	
	
public User modify(User nowUser, User newUser) {
		
		
		try {
		newUser.setId(nowUser.getId());
		newUser.setAdmin(nowUser.getAdmin());
		if(newUser.getPw()!=null || newUser.getPw().length() !=0) {
		
		String encPw = passwordEncoder.encode(newUser.getPw());
		newUser.setPw(encPw);
		}
		else {
			newUser.setPw(nowUser.getPw());

		}
		userMapper.updateUser(newUser);
		
		return newUser;
		
	}catch(Exception e) {
		System.out.println("회원정보 수정에서 예외처리 발생!!");
		e.printStackTrace();
		return null;
	}

}
public boolean withdreaw(User user) {
	try {
	userMapper.withdraw(user);
	return true;
	
	}catch(Exception e) {
		System.out.println("회워낱ㄹ퇴 에 생긴 예외 처리");
		e.printStackTrace();
	}
	return false;
}

public boolean isAdmin(User user) {
	//관리지인지 아닌지 알려주는거
		if(user.getAdmin().compareTo("USER")!=0)
			return  true;
		return false;
	}



//로그용


public ArrayList<User> getUserLog(String id) {
	return userMapper.getUserLog(id);
			}





//권한 수정용

public boolean ChangeAdmin(String id) {
	userMapper.changeAdmin(id);
	
	return true;
}

public boolean ChangeUser(String id) {
	userMapper.changeUser(id);
	return true;
	
}

public boolean checkUser(String id) {
	User user = userMapper.loginById(id);
	if(user != null)
		return true;
	return false;
}
}



