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
import cap.stone.design.server.ImgServer;
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
	private int serverPort1 = 5801;
	private int serverPort2 = 5802;
	private int serverPort3 = 5803;
	private int serverPort4 = 5804;
	private String str;
	private int videoNum = 0;
	private String videoDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\video\\";
	private String txtDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\txtfile\\";
	private String firstVideo = "aaCCTV";
	private String secondVideo = "bbCCTV";
	private String thirdVideo = "ccCCTV";
	private String forthVideo = "ddCCTV";

	@RequestMapping("/resultCCTV")
	public String HumanRequest(@RequestParam(value = "kind", required = true) String kind,
			@RequestParam(value = "humanKind", required = false) String humanKind, Human human, Pets pet, Thing thing,
			Model model, HttpServletRequest request) throws Exception {
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
		switch (humanKind) {
		case "humanImgFile":
			System.out.println("humanImgFile");
			ImgServer imgServer = new ImgServer(serverIP, serverPort1, "사진이름", firstVideo);
			imgServer.run();
			break;
		case "humanText":
			System.out.println("humanText");
			Server sv1 = new Server(serverIP, serverPort1);
			sv1.setMsg(str + firstVideo);
			sv1.run();
			Server sv2 = new Server(serverIP, serverPort2);
			sv2.setMsg(str + secondVideo);
			sv2.run();
			Server sv4 = new Server(serverIP, serverPort4);
			sv4.setMsg(str + forthVideo);
			sv4.run();
			break;
		}
		Server2 Asv1 = new Server2(serverIP, serverPort1, firstVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv1.run();
		Server2 sv1_txt = new Server2(serverIP, serverPort1, firstVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv1_txt.run();
		Server2 Asv2 = new Server2(serverIP, serverPort2, secondVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv2.run();
		Server2 sv2_txt = new Server2(serverIP, serverPort2, secondVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv2_txt.run();
		Server2 Asv4 = new Server2(serverIP, serverPort4, forthVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv4.run();
		Server2 sv4_txt = new Server2(serverIP, serverPort4, forthVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv4_txt.run();

		Thread.sleep(5000);
		return "resultCCTV";

	}

	@ResponseBody
	@RequestMapping(value = "/changeCCTV", method = RequestMethod.POST)
	public HashMap<String, Object> changeRequest(HttpServletRequest request, @RequestParam int num,
			@RequestParam int aCurrentTime, @RequestParam int bCurrentTime, @RequestParam int cCurrentTime,
			@RequestParam int dCurrentTime, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		videoNum = num;

		Server2 Asv1 = new Server2(serverIP, serverPort1, firstVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv1.run();
		Server2 sv1_txt = new Server2(serverIP, serverPort1, firstVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv1_txt.run();
		Server2 Asv2 = new Server2(serverIP, serverPort2, secondVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv2.run();
		Server2 sv2_txt = new Server2(serverIP, serverPort2, secondVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv2_txt.run();
		Server2 Asv4 = new Server2(serverIP, serverPort4, forthVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv4.run();
		Server2 sv4_txt = new Server2(serverIP, serverPort4, forthVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv4_txt.run();

		mvs.mergeVideo(videoDirectoryPath, firstVideo, videoNum);
		mvs.mergeVideo(videoDirectoryPath, secondVideo, videoNum);
		// mvs.mergeVideo(request, thirdVideo, videoNum);
		mvs.mergeVideo(videoDirectoryPath, forthVideo, videoNum);

		map.put("num", videoNum);
		map.put("aCurrentTime", aCurrentTime);
		map.put("bCurrentTime", bCurrentTime);
		map.put("cCurrentTime", cCurrentTime);
		map.put("dCurrentTime", dCurrentTime);
		Thread.sleep(5000);
		return map;
	}

}
