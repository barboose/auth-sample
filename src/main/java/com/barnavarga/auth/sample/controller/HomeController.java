package com.barnavarga.auth.sample.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author bvarga and created on 2020. 04. 05..
 */
@RestController
public class HomeController
{
	@GetMapping("/")
	public Map<String, String> hello()
	{
		final HashMap<String, String> response = new HashMap<>();
		response.put("ping", "pong");
		return response;
	}
}
