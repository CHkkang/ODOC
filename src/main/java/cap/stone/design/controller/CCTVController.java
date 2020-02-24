package cap.stone.design.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cap.stone.design.model.Dog;
import cap.stone.design.model.Human;
import cap.stone.design.model.Thing;

@Controller
public class CCTVController {
	
	@RequestMapping("/cctvv")
	public String HumanRequest(HttpServletRequest request){ 
		System.out.println("Áö³ª³Ä?");
		String [] arr = request.getParameterValues("human");
		System.out.println(arr[0] + arr[1] + arr[2]);
		return "cctv";

   }
}
