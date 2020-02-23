package cap.stone.design.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cctv")
public class CCTVController {

	@RequestMapping(value="/cctv")
	public String ReceiveData(HttpServletRequest req, Model model) {
		
		String kind = req.getParameter("kind");
		String color = req.getParameter("color");
		/*
		if(kind.equals("human"))
			model.addAttribute("human",human);
		else if(kind.equals("thing"))
			model.addAttribute("human",human);
		else if(kind.equals("dog"))
			model.addAttribute("human",human);
		else
			return "error";
			*/
		return "cctv";
	}
}
