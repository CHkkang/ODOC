package cap.stone.design.service;

import cap.stone.design.model.Thing;

public class ThingService {
	private Thing thing = new Thing();
	private String s ="";
	public String getString() {
		s = thing.getThingKind() + "&";
		return s;
	}
}
