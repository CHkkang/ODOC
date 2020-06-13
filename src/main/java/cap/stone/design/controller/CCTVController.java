package cap.stone.design.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cap.stone.design.model.Human;
import cap.stone.design.model.Pets;
import cap.stone.design.model.Thing;
import cap.stone.design.server.Server;
import cap.stone.design.server.Server2;
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
	private String serverIP = "172.30.1.12";
	private int serverPort = 5804;
	private String str;
	private int videoNum = 0;
	private String videoDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\video\\";
	private String txtDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\txtfile\\";
	private String firstVideo = "aaCCTV";
	private String secondVideo = "";
	private String thirdVideo = "";
	private String forthVideo = "";

	@RequestMapping("/resultCCTV")
	public String HumanRequest(@RequestParam(value = "kind", required = true) String kind, Human human, Pets pet,
			Thing thing, Model model, HttpServletRequest request) throws Exception {
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

		Server server = new Server(serverIP, serverPort, videoDirectoryPath);
		server.setMsg(str + firstVideo);
		server.run();
		Server2 sv1_txt = new Server2(serverIP, serverPort, firstVideo + Integer.toString(videoNum), ".txt", txtDirectoryPath);
		sv1_txt.run();
		Thread.sleep(5000);
		return "resultCCTV";

	}

	@ResponseBody
	@RequestMapping(value = "/changeCCTV", method = RequestMethod.POST)
	public HashMap<String, Object> changeRequest(HttpServletRequest request, @RequestParam int num,
			@RequestParam int aCurrentTime,
			@RequestParam int bCurrentTime,
			@RequestParam int cCurrentTime,
			@RequestParam int dCurrentTime,Model model)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		videoNum = num;

		Server2 Asv2 = new Server2(serverIP, serverPort, firstVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv2.run();
		Server2 Asv2_txt = new Server2(serverIP, serverPort, firstVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		Asv2_txt.run();
		/*
		 * Server2 Bsv2 = new Server2(serverIP, serverPort, secondVideo +
		 * Integer.toString(num), ".mp4"); Bsv2.run(); Server2 Bsv2_txt = new
		 * Server2(serverIP, serverPort, secondVideo + Integer.toString(num), ".txt");
		 * Bsv2_txt.run(); Server2 Csv2 = new Server2(serverIP, serverPort, thirdVideo +
		 * Integer.toString(num), ".mp4"); Csv2.run(); Server2 Csv2_txt = new
		 * Server2(serverIP, serverPort, thirdVideo + Integer.toString(num), ".txt");
		 * Csv2_txt.run(); Server2 Dsv2 = new Server2(serverIP, serverPort, forthVideo +
		 * Integer.toString(num), ".mp4"); Dsv2.run(); Server2 Dsv2_txt = new
		 * Server2(serverIP, serverPort, forthVideo + Integer.toString(num), ".txt");
		 * Dsv2_txt.run();
		 */

		mvs.mergeVideo(videoDirectoryPath, firstVideo, videoNum);
		// mvs.mergeVideo(request, secondVideo, videoNum);
		// mvs.mergeVideo(request, thirdVideo, videoNum);
		// mvs.mergeVideo(request, forthVideo, videoNum);

		map.put("num", videoNum);
		map.put("aCurrentTime", aCurrentTime);
		map.put("bCurrentTime", bCurrentTime);
		map.put("cCurrentTime", cCurrentTime);
		map.put("dCurrentTime", dCurrentTime);
		Thread.sleep(5000);
		return map;
	}

}
