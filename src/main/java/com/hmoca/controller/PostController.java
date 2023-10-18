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

import com.hmoca.entity.Dist;
import com.hmoca.entity.Post;
import com.hmoca.mapper.DistMapper;
import com.hmoca.mapper.PostMapper;
@Controller
public class PostController {
	
	@Autowired
	private PostMapper mapper;
		
	@Autowired
	private DistMapper mapper2;
	
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
	
	
	@RequestMapping("/boardInsertForm1.do")
	public String boardInsertForm1(@PathVariable("dist_idx")int dist_idx, Model model) {
		Dist vo = mapper2.selectDist(dist_idx);
		model.addAttribute("vo", vo);
		
		return "boardInsertForm1/{dist_idx}";
//		return "redirect:/boardInsert.do";
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Post vo) {
		System.out.println("dist_idx : "+vo.getDist_idx());
		if(vo.getDist_idx() == 15) {
			// 일반게시글
			mapper.insertPost1(vo);
		}else {
			// 넣을 dist_idx가 있으면 (스크랩)
			mapper.insertPost(vo);
		}
		
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
	
	
	/*
	 * // 내가 쓴 게시물 리스트 불러오기
	 * 
	 * @RequestMapping("/myPage.do") public String MypostList(Model model) {
	 * 
	 * List<Post> list = mapper.MypostList();
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * return "myPage"; }
	 */
	
	// 내가 쓴 게시글 내용
	/*
	 * @RequestMapping("/myPage.do/{user_id}") public String
	 * Mypostcontent(@PathVariable("user_id") String user_id, Model model) {
	 * 
	 * 
	 * Post vo = mapper.Mypostcontent(user_id); model.addAttribute("vo", vo); return
	 * "myPage"; }
	 */
}
