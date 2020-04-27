package cap.stone.design.service;

import cap.stone.design.model.Pets;

public class PetService {
	private Pets pet = new Pets();
	private String s ="";
	public String getString() {
		s = pet.getPetKind() + "&";
		return s;
	}
}
