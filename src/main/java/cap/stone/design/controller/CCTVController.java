package cap.stone.design.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cap.stone.design.service.CCTVService;

@Controller
@RequestMapping("/cctv")
public class CCTVController {
	@Autowired
	private CCTVService cctvService;
	
	@RequestMapping("/cctv")
	public String showCCTV(@RequestParam("kind") String kind, Model model) {
		if(kind == "human")
			joinDataHuman();
		else if(kind == "dog")
			joinDataDog();
		else if(kind == "thing")
			joinDataThing();
		else
			return "error";
		model.addAttribute("time", 5);
		model.addAttribute("text", "text");
		return "cctv";
	}
	
	public String joinDataDog() {
		return "cctv";
	}
	public String joinDataHuman() {
		return "cctv";
	}
	public String joinDataThing() {
		return "cctv";
	}
}
