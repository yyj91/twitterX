package com.twitter.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//전체 회원 뽑기
	@GetMapping("/list")
	public ModelAndView member() {
		ModelAndView mv = new ModelAndView("list");
		List<MemberDTO> member = memberService.member();
		mv.addObject("list", member);
		return mv;
	}

}
