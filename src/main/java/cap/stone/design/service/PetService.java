package cap.stone.design.service;

import cap.stone.design.model.Pets;

public class PetService {
	private Pets pet = new Pets();
	private String returnString = "";

	public PetService(Pets pet) {
		this.pet = pet;
	}

	public String getString() {
		returnString = pet.getPetKind() + "&";
		return returnString;
	}
}
