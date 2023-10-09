package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hmoca.entity.Post;
import com.hmoca.mapper.PostMapper;
@Controller
public class PostController {
	
	@Autowired
	private PostMapper mapper;
		
	// 게시판 리스트 불러오기
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<Post> list = mapper.postList();
		model.addAttribute("list", list);
		
		return "boardList";
	}
	
	// 게시글 내용
	@RequestMapping("/boardContent.do/{post_idx}")
	public String boardContent(@PathVariable("post_idx") int post_idx, Model model) {
		
		mapper.postCount(post_idx);	// 조회수 1증가	
		
		Post vo = mapper.selectPost(post_idx);
		model.addAttribute("vo", vo);
		return "boardContent";
	}
	
	// 게시글 작성
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Post vo) {
		
		mapper.insertPost(vo);
		
		return "redirect:/boardList.do";
	}
	
	// 게시글 삭제
	@RequestMapping("/boardDelete.do/{post_idx}")
	public String boardDelete(@PathVariable("post_idx") int post_idx) {
		
		mapper.DeletePost(post_idx);
		
		return "redirect:/boardList.do"; // 삭제 완료하고 나면 boardList.jsp로 이동
	}
	
	// 게시글 수정	
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int post_idx, Model model) {
		Post vo = mapper.selectPost(post_idx);
		model.addAttribute("vo", vo);
		
		return "boardUpdateForm";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Post vo) {
		
		mapper.UpdatePost(vo);
		
		return "redirect:/boardList.do";
	}
	
	
}
