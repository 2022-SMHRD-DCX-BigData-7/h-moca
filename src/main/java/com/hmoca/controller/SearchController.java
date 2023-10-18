package com.hmoca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmoca.entity.Search;
import com.hmoca.mapper.SearchMapper;

@Controller
public class SearchController {
		@Autowired
	    private SearchMapper searchMapper;
		
		@RequestMapping("/result.do")
		public String searchResults(@RequestParam("user_id") String user_id, @RequestParam("url_name") String url_name, Model model) {
		        // 검색 기능
		        Search search = new Search();
		        search.setUser_id(user_id);
		        search.setUrl_name(url_name);
		        
		        // 검색 정보를 db에 저장
		        searchMapper.insertSearch(search);
		        
		        // 검색 결과를 가져옴 (flask에서 search_info 값 가져가서 dist_info에 넣어줌) 
//		        List<Search> searchList = searchMapper.searchList(search);
//		        model.addAttribute("searchList", searchList);

		        return "result"; 
		    }
	}

