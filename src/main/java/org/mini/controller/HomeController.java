package org.mini.controller;

import org.mini.model.HomeVO;
import org.mini.model.ilchonVO;
import org.mini.service.HomeService;
import org.mini.service.ilchonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	ilchonService is;
	HomeService hs;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HomeVO hvo) {

		try {
			model.addAttribute("total_diary", hs.total_diary());
			model.addAttribute("total_photo", hs.total_photo());
			model.addAttribute("total_visit", hs.total_visit());
		} catch (NullPointerException e) {
			model.addAttribute("total_diary", 0);
			model.addAttribute("total_photo", 0);
			model.addAttribute("total_visit", 0);
		}


		model.addAttribute("ilchonlist", is.list());

		return "home";
	}

	@RequestMapping(value = "/ilchonWrite", method = RequestMethod.POST)
	public String ilchonWrite(ilchonVO ivo) {
		is.write(ivo);
		return "redirect:/";
	}


	@RequestMapping(value = "/ilchonDelete", method = RequestMethod.GET)
	public String ilchonDelete(ilchonVO ivo) {
		is.delete(ivo);
		return "redirect:/";
	}

	@RequestMapping(value = "/audio", method = RequestMethod.GET)
	public String audio() {
		return "audio";
	}

}
