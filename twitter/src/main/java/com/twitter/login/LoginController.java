package com.twitter.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request) {

		LoginDTO dto = new LoginDTO();
		dto.setMid(request.getParameter("id"));
		dto.setMpw(request.getParameter("pw"));

		dto = loginService.login(dto);

		if (dto.getCount() == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("tnick", dto.getTnick());
			session.setAttribute("mname", dto.getMname());
			session.setAttribute("mid", request.getParameter("id"));

			return "redirect:main";
		} else {
			return "login";
		}

	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		if (session.getAttribute("mname") != null ) {
			session.removeAttribute("mname");
		}
		if (session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		session.setMaxInactiveInterval(0);
		
		session.invalidate();
		
		return "redirect:login";
	}
}
