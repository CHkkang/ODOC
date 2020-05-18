package cap.stone.design.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cap.stone.design.model.Human;
import cap.stone.design.model.Pets;
import cap.stone.design.model.Thing;
import cap.stone.design.model.TimeMarker;
import cap.stone.design.server.Server;
import cap.stone.design.service.HumanService;
import cap.stone.design.service.MergeVideoService;
import cap.stone.design.service.PetService;
import cap.stone.design.service.ThingService;

@Controller
public class CCTVController {
	private HumanService hs;
	private ThingService ts;
	private PetService ps;
	private MergeVideoService mvs;
	private Server server = new Server("172.20.10.4", 8069);
	private String str;
	private int videoNum;
	

	@RequestMapping("/resultcctv")
	public String HumanRequest(@RequestParam(value = "kind", required = true) String kind, Human human, Pets pet,
			Thing thing, TimeMarker timemarker, Model model, HttpServletRequest request) throws Exception {
		System.out.println(kind);
		hs = new HumanService(human);
		ts = new ThingService(thing);
		ps = new PetService(pet);
		mvs = new MergeVideoService();
		switch (kind) {
		case "human":
			str = hs.getString();
			break;
		case "pet":
			str = ps.getString();
			break;
		case "thing":
			str = ts.getString();
			break;
		}
		videoNum = 1;
		String directoryPath =  request.getServletContext().getRealPath("/resource/video/");
		System.out.println(directoryPath);
		System.out.println(str);
		mvs.mergeVideo(directoryPath, "aaCCTV_", videoNum);
		server.setMsg(str + "aaCCTV_" + Integer.toString(videoNum));
		server.run();
		

		return "resultCCTV";

	}
}