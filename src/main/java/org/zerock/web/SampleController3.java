package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SampleController3 {
	
	private static final Logger logger =
			LoggerFactory.getLogger(SampleController3.class);
	
	@RequestMapping("/doD")
	public String doD(Model model) {
		
		ProductVO product = new ProductVO("sampl product", 10000);
		
		logger.info("doD");
		
		model.addAttribute(product);
		
		return "productDetail";
		
	}
	
	@RequestMapping("/json")
	public @ResponseBody ProductVO dojson(){
		
		ProductVO vo = new ProductVO("샘플상품",30000);
		
		return vo;
	}
	
}
