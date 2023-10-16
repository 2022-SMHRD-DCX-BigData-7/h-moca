package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmoca.entity.Comment;
import com.hmoca.entity.Post;
import com.hmoca.entity.Rank;
import com.hmoca.mapper.CmtMapper;



@RestController
public class CmtController {
	
	@Autowired
	private CmtMapper mapper;
	
	@Autowired
	private CmtMapper rmapper;

	@GetMapping("/cmt")
	public List<Comment> cmtAjaxList(){
				
		List<Comment> list = mapper.commentList();
		
		return list;
		
	}
	
	@PostMapping("/cmt")
	public void cmtAjaxInsert(Comment vo){  
		System.out.println("vo에 담긴 content : "+vo.getCmt_content());
		mapper.insertComment(vo);
	}
	
	@DeleteMapping("/cmt/{cmt_idx}")
	public void cmtAjaxDelete(@PathVariable int cmt_idx) {
		mapper.DeleteComment(cmt_idx);
	}
	
	// 댓글 작성
//	@RequestMapping("/cmt")
//	public void insertComment() {	}
//		
//	@PostMapping("/cmtInsert.do")
//	public String insertComment(Comment vo) {
//			
//		mapper.insertComment(vo);
//			
//		return "redirect:/boardContent.do";
//		}
	
	// 랭크
	@GetMapping("/rank")
	public List<Rank> boardAjaxList(){
		// @RestController 표시 덕분에 @ResponseBody 안 써도 됨
		List<Rank> list = mapper.rankList();
		for(Rank r:list) {
			System.out.println("list에는 담긴 name : "+r.getVideo_name());
		}
		
		return list;
	}
	
	@GetMapping("/postrank")
	public List<Post> boardList(){
		// @RestController 표시 덕분에 @ResponseBody 안 써도 됨
		List<Post> ranklist = rmapper.postrankList();
		for(Post p : ranklist) {
			System.out.println("ranklist에는 담긴 name : "+p.getPost_title());
		}
		
		return ranklist;
	}
	
	
	// 유튜브 url 변환 하고 있는 중 !!!!

	/*
	 * @RestController public class URLController {
	 * 
	 * @GetMapping("/result") public String convertURL(@RequestParam("shortURL")
	 * String shortURL) { // 유튜브 url 변환 String convertedURL =
	 * convertYouTubeShortURLToWatchURL(shortURL); return convertedURL; }
	 * 
	 * private String convertYouTubeShortURLToWatchURL(String shortURL) { // 유튜브 쇼츠
	 * url -> 유튜브 url 일반 동영상으로 변환 String watchURL = shortURL.replace("/shorts/",
	 * "/watch?v="); return watchURL; }
	 * 
	 * }
	 */
}
