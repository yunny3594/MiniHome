package org.mini.controller;

import org.mini.model.visitVO;
import org.mini.service.visitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VisitController {

	@Autowired
	visitService vs;

	// 방명록화면
	@RequestMapping(value = "/visit", method = RequestMethod.GET)
	public String visit(Model model, visitVO vvo) {
		model.addAttribute("list", vs.list());
		return "/visit/visit";
	}

	// 방명록 등록
	@RequestMapping(value = "/visitWrite", method = RequestMethod.POST)
	public String visitWrite(visitVO vvo) {
		vs.write(vvo);
		return "redirect:/visit";
	}

	// 방명록 수정
	@RequestMapping(value = "/visitModify", method = RequestMethod.POST)
	public String visitModify(visitVO vvo) {
		vs.modify(vvo);
		return "redirect:/visit";
	}

	// 방명록 삭제
	@RequestMapping(value = "/visitDelete", method = RequestMethod.GET)
	public String visitDelete(visitVO vvo) {
		vs.delete(vvo);
		return "redirect:/visit";
	}
}
