package cap.stone.design.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	@RequestMapping(value = "/cctv")
	public String cctv() {
		return "cctv";
	}
	@RequestMapping(value = "/test")
	public String test4() {
		return "test";
	}
	@RequestMapping(value = "/sibal")
	public String sibal() {
		return "sibal";
	}
}
