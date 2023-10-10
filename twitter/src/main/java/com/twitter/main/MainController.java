package com.twitter.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.twitter.util.Util;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	Util util;

	@GetMapping("/main")
	public String main(Model model) {

		List<MainDTO> list = mainService.mainList();

		model.addAttribute("list", list);
		return "main";
	}

	@PostMapping("/main")
	public String write2(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {

			MainDTO dto = new MainDTO();

			dto.setMid((String) session.getAttribute("mid"));
			dto.setTnick((String) session.getAttribute("tnick"));

			dto.setTwrite(request.getParameter("content"));
 
			mainService.write(dto);

			return "redirect:/main";
		}

		else {
			return "redirect:/login";
		}
	}

	@GetMapping("/detail")
	public String detail(@RequestParam(value = "tno", required = true) int tno, Model model) {
		System.out.println(tno);
		Map<String, Object> detail = mainService.detail(tno);
		// System.out.println(detail);
		List<MainDTO> commentList = mainService.commentList(tno);

		model.addAttribute("detail", detail);
		model.addAttribute("commentList", commentList);
		return "detail";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(value = "tno") int tno, HttpSession session) {
//			System.out.println(tno);
		if (session.getAttribute("mid") != null) {
			MainDTO dto = new MainDTO();
			dto.setTno(tno);
			dto.setMid((String) session.getAttribute("mid"));
			// System.out.println((String)session.getAttribute("mid"));
			mainService.delete(dto);

			return "redirect:/main";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/edit")
	public String edit(@RequestParam(value = "tno") int tno, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("mid") != null) {
			MainDTO dto = new MainDTO();

			dto.setTno(tno);

			dto.setMid((String) session.getAttribute("mid"));
			// System.out.println((String)session.getAttribute("mid"));
			// mainService.edit(dto);
			Map<String, Object> map = mainService.detail(tno);
			// System.out.println(map.get("twrite"));
			request.setAttribute("detail", map);
			
			return "/edit";
		} else {
			return "redirect:/login";
		}
	}

	@PostMapping("/edit")
	public String edit(MainDTO dto, HttpSession session) {
		// System.out.println(dto.getTwrite());
		dto.setMid((String) session.getAttribute("mid"));

		mainService.edit(dto);

		return "redirect:/detail?tno=" + dto.getTno();

	}
	
	
	@GetMapping("/likeup")
    public String likeup(@RequestParam int tno) {
		
		System.out.println(tno);
		
	    int result = mainService.likeup(tno);
		
	    System.out.println(result);
		return "redirect:/main";
	}
	
	@GetMapping("/hateup")
    public String hateup(@RequestParam int tno) {
		
		System.out.println(tno);
		
	    int result = mainService.hateup(tno);
		
	    System.out.println(result);
		return "redirect:/main";
	}
	
	@GetMapping("/cdel") 
	public String cdel(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {			
			if(map.containsKey("tno") && map.get("cno") != null && 			
					!(map.get("tno").equals("")) && !(map.get("cno").equals("")) && 	
					
			util.isNum(map.get("tno")) && util.isNum(map.get("cno"))) { 
				
				
				map.put("mid", session.getAttribute("mid"));
				int result = mainService.cdel(map);
				System.out.println("삭제 결과 : " + result);
			}
			
		}
		return "redirect:/detail?tno="+map.get("tno"); 
	}
	
	
	@PostMapping("/cedit") 
	public String cedit(@RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			if(map.get("tno") != null && !(map.get("tno").equals("")) && 
				map.containsKey("cno") && !(map.get("cno").equals(""))  ) {
				map.put("mid", session.getAttribute("mid"));
				
				System.out.println(map);
				int result = mainService.cedit(map);
				System.out.println(result);
				
				return "redirect:/detail?tno="+map.get("tno");
			} else {
				return "redirect:/main";
			}
			
		
		} else {
			return "redirect:/login";
		}
		
	}
	
	
	
	
	

	@GetMapping("/search")
	public String search() {
		return "search";
	}

	@GetMapping("/alarm")
	public String alarm() {
		return "alarm";
	}

	@GetMapping("/message")
	public String message() {
		return "message";
	}

	@GetMapping("/verification")
	public String verification() {
		return "verification";
	}

	@GetMapping("/posting")
	public String posting() {
		return "posting";
	}

	@GetMapping("/profile")
	public String profile() {
		return "profile";
	}

	@GetMapping("/upload")
	public String upload() {
		return "upload";
	}

}
