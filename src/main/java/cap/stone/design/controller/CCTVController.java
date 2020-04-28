package cap.stone.design.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cap.stone.design.model.Human;
import cap.stone.design.model.Pet;
import cap.stone.design.model.Thing;
import cap.stone.design.model.TimeMarker;
import cap.stone.design.server.Server;

@Controller
public class CCTVController {
	private Server server = new Server("192.168.219.101", 5803);
	private Human human;
	private Pet pet;
	private Thing thing;

	@RequestMapping("/cctv")
	public String HumanRequest(@RequestParam(value = "kind", required = true) String kind, Human human, Pet pet,
			Thing thing, TimeMarker timemarker, Model model) {
		System.out.println(kind);
		switch (kind) {
		case "human":
			System.out.println(human.getBottomColor());
			System.out.println(human.getBottomKind());
			System.out.println(human.getTopColor());
			System.out.println(human.getTopKind());
			break;
		case "pet":
			System.out.println(pet.getPetKind());
			break;
		case "thing":
			System.out.println(thing.getThingKind());
			break;
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