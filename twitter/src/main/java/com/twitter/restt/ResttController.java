package com.twitter.restt;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.twitter.main.MainService;
import com.twitter.util.Util;

@RestController
@Controller
public class ResttController {
	
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private Util util;
	
	@PostMapping("/cdelR") 
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
		
		
		int result = 0;
		if(session.getAttribute("mid") != null) {
			 
		
			 if(map.containsKey("tno") && map.get("cno") != null &&
					 
			 	!(map.get("tno").equals("")) && !(map.get("cno").equals("")) && 	
				
				util.isNum(map.get("tno")) && util.isNum(map.get("cno"))) {
			
				map.put("mid", session.getAttribute("mid"));
			 	System.out.println(map);
				result = mainService.cdel(map);			
						
				}
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
	
		return json.toString();
	
}

}
