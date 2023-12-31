package com.hmoca.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.hmoca.entity.Dist;
import com.hmoca.entity.Search;
import com.hmoca.entity.User;
import com.hmoca.mapper.SearchMapper;
import com.hmoca.mapper.DistMapper;

@Controller
public class SearchController {
      @Autowired
       private SearchMapper searchMapper;
      
      @Autowired
       private DistMapper mapper;
      
      @Autowired
      private RestTemplate restTemplate;
      
      private final String BASE_URL = "http://localhost:9000/crawl";
//http://127.0.0.1:9000/crawl
      @RequestMapping("/search.do")
      public String searchResults(@RequestParam("user_id") String user_id, @RequestParam("url_name") String url_name, Model model, Model model2, HttpSession session) {
    	  
    	  // 검색 기능
          Search search = new Search();
          search.setUser_id(user_id);
          search.setUrl_name(url_name);

          // 검색 정보를 db에 저장
          searchMapper.insertSearch(search);

          // Flask 서버로 요청 보내기
          ResponseEntity<Search> responseEntity = restTemplate.exchange(
              BASE_URL,
              HttpMethod.GET,
              null,
              Search.class
          );
          
          User loginUser = (User)session.getAttribute("loginUser");
    	  
          model.addAttribute("user_id", user_id);
          model.addAttribute("url_name", url_name);

          // 검색 결과를 가져옴 (flask에서 search_info 값 가져가서 dist_info에 넣어줌) 
          // List<Search> searchList = searchMapper.searchList(search);
          // model.addAttribute("searchList", searchList);

          Dist vo = mapper.selectDist();
          model2.addAttribute("vo", vo);
          return "result"; 
      }

   }
