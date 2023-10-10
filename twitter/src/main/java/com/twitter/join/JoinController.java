package com.twitter.join;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	
	@GetMapping("/join") 
	public String join() {
		return "join";
	}

	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
	
	
		int res = joinService.join(joinDTO);
		
		System.out.println(joinDTO.getMname());
		System.out.println(joinDTO.getMid());
		System.out.println(joinDTO.getMpw());
		System.out.println(joinDTO.getMpn());
		System.out.println(joinDTO.getTnick());
		System.out.println(res);
		if (res == 1) {
			return "redirect:/";
		} else {
			return "redirect:/join";
		}


	}
	
	
	@ResponseBody
	@PostMapping("/checkID")
	public String checkID(@RequestParam("mid") String mid) {	
		System.out.println("mid : " + mid);		
		int result = joinService.checkID(mid);		
		JSONObject json = new JSONObject();
		json.put("result", result);		
		
		return json.toString();
}
}