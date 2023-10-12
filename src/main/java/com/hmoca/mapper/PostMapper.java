package com.hmoca.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.hmoca.entity.Post;
import com.hmoca.entity.Rank;
import com.hmoca.entity.User;

public interface PostMapper {
	// 게시물 
		public List<Post> postList();
		public void insertPost(Post vo);
		public Post selectPost(int post_idx); // content 
		public void UpdatePost(Post vo);
		public void DeletePost(int post_idx);
		
		
		// 조회수
		@Update("update post_info set post_views=post_views+1 where post_idx=#{post_idx}")
		public void postCount(int post_idx);

		public User login(User vo);
		
		
		

}
