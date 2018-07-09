package kr.green.springwebproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;
import kr.green.springwebproject.pagenation.Criteria;

@Service
public class AdminService {

	@Autowired
	BoardMapper boardMapper;
	@Autowired
	UserMapper userMapper;


public int getcountAdminBoard() {
	return boardMapper.getCountBoardByAdmin();
}
public ArrayList<Board> getAdminBoards(Criteria cri){
	
	return (ArrayList)boardMapper.getListPageByAdmin(cri);
}

public boolean isSuperAdmin(User user) {
	//관리지인지 아닌지 알려주는거
	if(user.getAdmin().compareTo("ADMIN")==0)
		
			return  false;
		return true;
	}


public boolean setBoardDissable(Integer number, String disable
		) {
	Board board = boardMapper.getBoardByNumber(number);
	board.setDisable(disable);
	boardMapper.modifyBoardByDisable(board);
	
	
	return true;
}

public int countUsersExceptLoginUSer(User nowUser) {
	
	return userMapper.countUsersExceptLoginUser(nowUser);
}
public ArrayList<User> userListExceptLoginUser(User nowUser, Criteria cri){
	return  (ArrayList)userMapper.userListExceptLoginUser(nowUser, cri);
}


public boolean userSet(String admin, String id) {
	
	User user = userMapper.loginById(id);
	if(user != null) {
	user.setAdmin(admin);
	userMapper.updateUser(user);
	return true;
	}
	return false;
}
	
	
	
	
public boolean boardDelete( Integer number) {
	
	
	if(number != null) {
		Board board = boardMapper.getBoardByNumber(number);
		boardMapper.deleteBoard(board);
		return true;
	}
	
	return false;
}

}
