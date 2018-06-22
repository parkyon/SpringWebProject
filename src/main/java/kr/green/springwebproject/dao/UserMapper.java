package kr.green.springwebproject.dao;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	public User login(
		@Param("id") String id,@Param("pw") String pw);
	public void signup(@Param("user")User user);
	
	public User loginById(@Param("id")String id);
	
	public void updateUser(@Param("user")User user);
}
