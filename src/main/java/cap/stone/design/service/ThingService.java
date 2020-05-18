package cap.stone.design.service;
import cap.stone.design.model.Thing;

public class ThingService {
	private Thing thing = new Thing();
	private String returnString = "";

	public ThingService(Thing thing) {
		this.thing = thing;
	}

	public String getString() {
		returnString = thing.getThingKind() + "&";
		return returnString;
	}
}
