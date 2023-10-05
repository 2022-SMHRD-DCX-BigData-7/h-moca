package com.hmoca.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.hmoca.entity.User;

public interface UserMapper {
	// ***** interface의 이름과 xml의 이름이 같아야 연결이 된다
	

	public String UserInsert(User vo);

	public User UserLogin(User vo);

}
