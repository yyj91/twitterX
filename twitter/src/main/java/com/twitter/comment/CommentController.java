package com.twitter.comment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping("/comment")
	public String comment(@RequestParam Map<String, Object> map, HttpSession session) {
		
		if(session.getAttribute("mid") != null) {
			System.out.println(session.getAttribute("mid"));
			
			map.put("mid", session.getAttribute("mid"));
			
			int result = commentService.commentInsert(map);
			if(result == 1) {
				return "redirect:/detail?tno="+map.get("tno");
				
			} else {
				return "warning";
			}
		} else {
			return "warning";
		}
	}

}
