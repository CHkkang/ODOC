package cap.stone.design.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import cap.stone.design.model.Human;
import cap.stone.design.model.Pets;
import cap.stone.design.model.Thing;
import cap.stone.design.model.TimeMarker;
import cap.stone.design.server.Server;
import cap.stone.design.service.HumanService;
import cap.stone.design.service.PetService;
import cap.stone.design.service.ThingService;

@Controller
public class CCTVController {
	private HumanService hs;
	private ThingService ts;
	private PetService ps;
	private Server server = new Server("192.168.219.101", 5803);
	private Human human;
	private Pets pet;
	private Thing thing;
	private String str;

	@RequestMapping("/cctv")
	public String HumanRequest(@RequestParam(value = "kind", required = true) String kind, 
							  Human human, 
							  Pets pet, 
							  Thing thing, 
							  TimeMarker timemarker, 
							  Model model) {
		System.out.println(kind);

		hs = new HumanService(human);
		ts = new ThingService(thing);
		ps = new PetService(pet);
		
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
		System.out.println(str);
		try {
			server.run(str);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<String> timeList = new ArrayList<>();
		String line = null;
		// 파일로 부터 읽어들인 조각들을 저장하는것
		String getLine = "";
		try {
			// 파일 객체 생성
			ClassPathResource resource = new ClassPathResource("timetxt/airport.txt");
			File file = resource.getFile();
			// 입력 스트림 생성
			FileReader reader = new FileReader(file);
			// 정수가 저장된 파일을 읽는다
			BufferedReader rd = new BufferedReader(reader);

			while ((line = rd.readLine()) != null) {
				System.out.println(line);
				getLine = getLine + line;
				// 읽어서 최종 String에 저장시킨다
			}
			rd.close();
		} catch (FileNotFoundException e) {
			System.out.print("파일 못찾는 실패");
			e.getStackTrace();
		} catch (IOException e) {
			System.out.print("io실패");
			e.getStackTrace();
		}

		getLine = getLine.replace("[", "");
		getLine = getLine.replace("]", "");
		System.out.println(getLine);
		StringTokenizer st = new StringTokenizer(getLine, ",");

		while (st.hasMoreTokens()) {
			timeList.add(st.nextToken());
			// 짤라준 조각들을 배열에 저장
		}
		System.out.println(timeList);
		timemarker.setSec(timeList);

		return "cctv";

	}
}