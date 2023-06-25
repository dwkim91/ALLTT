package com.app.alltt.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@GetMapping("/main")
	public String index() {
		return "/alltt/main";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/alltt/login";
	}
	
	@GetMapping("/categories")
	public String categories() {
		return "/alltt/categories";
	}
	
}
