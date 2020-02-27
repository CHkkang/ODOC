package cap.stone.design.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cap.stone.design.model.Dog;
import cap.stone.design.model.Human;
import cap.stone.design.model.ObjectDTO;
import cap.stone.design.model.Thing;

@Controller
public class CCTVController {
	
	@RequestMapping("/cctv")
	public String HumanRequest(@ModelAttribute ObjectDTO dto, Model model){ 
		System.out.println("Áö³ª³Ä?");
		String kind = dto.getKind();
		if(kind.equals("human")) {
			String top = dto.getTopColor();
			String bottom = dto.getBottomColor();
			String suit = dto.getSuitColor();
		}
		else if(kind.equals("thing")) {
			
		}
		else if(kind.equals("pet")) {
			
		}
		else {
			
		}
		
		return "cctv";

   }
}
