//package com.hmoca.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.hmoca.entity.Dist;
//import com.hmoca.entity.Post;
//import com.hmoca.entity.User;
//import com.hmoca.mapper.DistMapper;
//import com.hmoca.mapper.PostMapper;
//
//@Controller
//public class DistController {
//
//	@Autowired
//	private DistMapper mapper;
//	
//	@RequestMapping("/MyPage.do")
//	public String MyPage(Model model, HttpSession session) {
//		System.out.println("판별영상실행됨!!");
//		User loginUser = (User)session.getAttribute("loginUser");
//		String user_id = loginUser.getUser_id();
//		
//		
//		List<Dist> mylist = distmapper.MyDistList(user_id);
//		System.out.println(mylist.get(0).getDist_idx());
//		
//		 for(Dist p: mylist) { System.out.println("내 판별 영상");
//		 System.out.println(p.getDist_idx()); }
//		 
//
//		model.addAttribute("list", mylist);
//
//		return "myPage";
//	}
//}
