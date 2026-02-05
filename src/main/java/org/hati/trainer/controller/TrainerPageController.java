package org.hati.trainer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trainer")
public class TrainerPageController {

	/* 트레이너 화면 */
	@GetMapping
	public String trainerListPage() {
		return "trainer/trainerList";
	}
	
	/* 트레이너 카드 목록 가져오기*/
	@GetMapping("/cardList")
	  public String cardList(Model model) {
	    // TODO: model.addAttribute("popularTrainers", ...)
	    return "trainer/cardList"; 
	  }
	
	
	
}
