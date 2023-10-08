package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmoca.entity.Post;
import com.hmoca.mapper.PostMapper;

@Controller
public class MainController {
	
	@Autowired
	private PostMapper mapper;
		
	@GetMapping("/Main.do")
	public String Main() {
		return "main";
	}
		
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
				
		Post vo = mapper.selectPost(post_idx);
		model.addAttribute("vo", vo);
		return "boardContent";
	}
	
	// 게시글 삭제
	@RequestMapping("/boardDelete.do/{post_idx}")
	public String boardDelete(@PathVariable("post_idx") int post_idx) {
		
		mapper.DeletePost(post_idx);
		
		return "redirect:/boardList.do"; // 삭제 완료하고 나면 boardList.jsp로 이동
	}
	
	// 게시글 작성
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {	}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Post vo) {
		
		mapper.insertPost(vo);
		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int post_idx, Model model) {
		Post vo = mapper.selectPost(post_idx);
		model.addAttribute("vo", vo);
		
		return "boardUpdateForm";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Post vo) {
		
		mapper.Updatepost(vo);
		
		return "redirect:/boardList.do";
	}
}
