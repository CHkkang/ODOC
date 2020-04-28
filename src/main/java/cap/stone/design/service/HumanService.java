package cap.stone.design.service;

import cap.stone.design.model.Human;

public class HumanService {
	Human human = new Human();

	public HumanService(Human human) {
		this.human = human;
	}

	public String getString() {
		System.out.println("human Service");
		System.out.println(human.getBottomColor());
		String returnString = "person";

		if (human.getOnepieceKind() != null) {
			returnString = returnString + "&" + human.getOnepieceKind() + "&" + human.getOnepieceColor() + "&"; // 마지막에
																												// 영상이름
																												// 추가해줘야함
		} else {
			returnString = returnString + "&" + human.getTopKind() + "&" + human.getBottomKind() + "&"
					+ human.getTopColor() + "&" + human.getBottomColor() + "&"; // 마지막에 영상이름 추가해줘야함
		}

		return returnString;
	}
}