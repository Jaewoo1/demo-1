package com.exam.pro.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.pro.service.PapagoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PapagoController {

	@Autowired
	private PapagoService papagoService;	
	
	@GetMapping("/translate")
	public String translate(@RequestParam Map<String, String> param, Model m) throws JsonMappingException, JsonProcessingException {
		m.addAttribute("traslatedText", papagoService.translate(param));
		return "papago/translate";
	}
}