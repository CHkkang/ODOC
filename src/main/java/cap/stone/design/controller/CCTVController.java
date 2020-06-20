package cap.stone.design.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	private String serverIP1 = "localhost";
	private String serverIP2 = "172.30.1.12";
	private String serverIP3 = "172.30.1.12";
	private String serverIP4 = "172.30.1.3";
	private int serverPort1 = 5801;
	private int serverPort2 = 5802;
	private int serverPort3 = 5803;
	private int serverPort4 = 5804;
	private String str;
	private int videoNum = 0;
	private String videoDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\video\\";
	private String txtDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\txtfile\\";
	private String imgDirectoryPath = "C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\img\\";
	private String firstVideo = "bbCCTV";
	private String secondVideo = "aaCCTV";
	private String thirdVideo = "ccCCTV";
	private String forthVideo = "ddCCTV";

	@RequestMapping("/resultCCTV")
	public String CCTVRequest(@RequestParam(value = "kind", required = false) String kind,
			@RequestParam(value = "humanKind", required = false) String humanKind, Human human, Pets pet, Thing thing,
			@RequestParam(value = "file", required = false) MultipartFile file, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println(kind);
		hs = new HumanService(human);
		ts = new ThingService(thing);
		ps = new PetService(pet);
		if (kind == "pet")
			str = ps.getString();
		else if (kind == "thing")
			str = ts.getString();
		else
			System.out.println("human");
		videoNum = 1;

		switch (humanKind) {
		case "humanImgFile":
			String strFileName = imgDirectoryPath + file.getOriginalFilename();
			File f = new File(strFileName);
			FileCopyUtils.copy(file.getBytes(), f);
			System.out.println("humanImgFile");
			ImgServer imgServer1 = new ImgServer(serverIP1, serverPort1, strFileName, firstVideo);
			imgServer1.run();

			ImgServer imgServer2 = new ImgServer(serverIP2, serverPort2, strFileName, secondVideo);
			imgServer2.run();
			ImgServer imgServer3 = new ImgServer(serverIP3, serverPort3, strFileName, thirdVideo);
			imgServer3.run();
			ImgServer imgServer4 = new ImgServer(serverIP4, serverPort4, strFileName, forthVideo);
			imgServer4.run();

			break;
		case "humanText":
			str = hs.getString();
			System.out.println("humanText");
			System.out.println(str);
			Server sv1 = new Server(serverIP1, serverPort1);
			sv1.setMsg(str + firstVideo);
			sv1.run();

			Server sv2 = new Server(serverIP2, serverPort2);
			sv2.setMsg(str + secondVideo);
			sv2.run();
			Server sv3 = new Server(serverIP3, serverPort3);
			sv3.setMsg(str + thirdVideo);
			sv3.run();

			Server sv4 = new Server(serverIP4, serverPort4);
			sv4.setMsg(str + forthVideo);
			sv4.run();

			break;
		}

		Server2 Asv1 = new Server2(serverIP1, serverPort1, firstVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv1.run();
		Server2 sv1_txt = new Server2(serverIP1, serverPort1, firstVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv1_txt.run();

		Server2 Asv2 = new Server2(serverIP2, serverPort2, secondVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);

		Asv2.run();
		Server2 sv2_txt = new Server2(serverIP2, serverPort2, secondVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv2_txt.run();
		Server2 Asv3 = new Server2(serverIP3, serverPort3, forthVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv3.run();
		Server2 sv3_txt = new Server2(serverIP3, serverPort3, forthVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv3_txt.run();

		Server2 Asv4 = new Server2(serverIP4, serverPort4, forthVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv4.run();
		Server2 sv4_txt = new Server2(serverIP4, serverPort4, forthVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv4_txt.run();

		Thread.sleep(5000);

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

		Server2 Asv1 = new Server2(serverIP1, serverPort1, firstVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		System.out.println("run Start!");
		Asv1.run();
		Server2 sv1_txt = new Server2(serverIP1, serverPort1, firstVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv1_txt.run();
		System.out.println("run end!");

		Server2 Asv2 = new Server2(serverIP2, serverPort2, secondVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv2.run();
		Server2 sv2_txt = new Server2(serverIP2, serverPort2, secondVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv2_txt.run();
		Server2 Asv3 = new Server2(serverIP3, serverPort3, forthVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv3.run();
		Server2 sv3_txt = new Server2(serverIP3, serverPort3, forthVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv3_txt.run();

		Server2 Asv4 = new Server2(serverIP4, serverPort4, forthVideo + Integer.toString(videoNum), ".mp4",
				videoDirectoryPath);
		Asv4.run();
		System.out.println("조재원 병신");
		Server2 sv4_txt = new Server2(serverIP4, serverPort4, forthVideo + Integer.toString(videoNum), ".txt",
				txtDirectoryPath);
		sv4_txt.run();

		mvs = new MergeVideoService();
		mvs.mergeVideo(videoDirectoryPath, firstVideo, videoNum);

		mvs.mergeVideo(videoDirectoryPath, secondVideo, videoNum);
		mvs.mergeVideo(videoDirectoryPath, thirdVideo, videoNum);
		mvs.mergeVideo(videoDirectoryPath, forthVideo, videoNum);

		map.put("num", videoNum);
		map.put("aCurrentTime", aCurrentTime);
		map.put("bCurrentTime", bCurrentTime);
		map.put("cCurrentTime", cCurrentTime);
		map.put("dCurrentTime", dCurrentTime);
		Thread.sleep(5);
		return map;
	}

}
