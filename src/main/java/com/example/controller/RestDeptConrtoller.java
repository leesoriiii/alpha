package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.DeptMapper;
import com.example.model.Dept;

@Controller
@RequestMapping("/rest/dept")
public class RestDeptConrtoller {
	
	@Autowired
	DeptMapper mapper;
	
	@GetMapping
	@ResponseBody
	ResponseEntity<Object> get() {
		System.out.println("get()..");
		var list = mapper.selectAll();
		var body = new HashMap<String, Object>();
		body.put("result", "success");
		body.put("data", list);
		
		return new ResponseEntity<Object>(body, HttpStatus.OK);
		
	}
	
	@PostMapping
	@ResponseBody
	ResponseEntity<Object> post(@RequestBody Dept dept) {
		System.out.println("post()..");
		System.out.println(dept);
		
		
		mapper.insert(dept);
		var body = new HashMap<String, Object>();
		body.put("result", "success");
		body.put("data", dept);
		
		
		return new ResponseEntity<Object>(body, HttpStatus.OK);
	}

}
