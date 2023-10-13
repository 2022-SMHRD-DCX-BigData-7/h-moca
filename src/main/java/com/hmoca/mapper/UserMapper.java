package com.hmoca.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hmoca.entity.Post;
import com.hmoca.entity.User;

public interface UserMapper {
	// ***** interface의 이름과 xml의 이름이 같아야 연결이 된다
	

	public void UserInsert(User vo);

	public User UserLogin(User vo);
	
	public void UserUpdate(User vo);
	
	public User UserSelect(String user_id);  

	 public boolean UserExists(String user_id);
	 
	 public boolean UserNoExists(String user_id);
	 

}
