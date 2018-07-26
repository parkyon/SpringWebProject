package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

public interface UserMapper {
	public User login(
		@Param("id") String id,@Param("pw") String pw);
	public void signup(@Param("user")User user);
	
	public User loginById(@Param("id")String id);
	
	public void updateUser(@Param("user")User user);
	
	public List<User> 
		userListExceptLoginUser(@Param("user")User user,
				@Param("cri")Criteria cri);
	public int countUsersExceptLoginUser(@Param("user")User user);
	public void withdraw(@Param("user")User user);
	
	public void deleteUser(@Param("user")User user,@Param("id")String id);
	///로그용
	
		public ArrayList<User> getUserLog(
				@Param("id")String id);

}
