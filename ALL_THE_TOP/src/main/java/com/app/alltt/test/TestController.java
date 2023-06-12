package com.app.alltt.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/alltt")
public class TestController {

	@GetMapping("/index")
	public String index() {
		return "/alltt/index";
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
