package org.mini.controller;

import org.mini.model.DiaryCriteriaVO;
import org.mini.model.DiaryPageVO;
import org.mini.model.DiaryVO;
import org.mini.service.DiaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class DiaryController {
	@Autowired
	DiaryService ds;
	
	//바로 첫 화면=최신글
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, DiaryCriteriaVO cri) {
		model.addAttribute("diary", ds.diary(cri));
		int total = ds.total();
		model.addAttribute("paging", new DiaryPageVO(cri, total));
		return "/diary/diary";
	}
	
	//다이어리쓰기
	@RequestMapping(value = "/diaryWrite", method = RequestMethod.GET)
	public String diaryWrite() {
		return "/diary/diaryWrite";
	}
	@RequestMapping(value = "/diaryWrite", method = RequestMethod.POST)
	public String diaryWrite(DiaryVO dvo) {
		ds.write(dvo);
		return "redirect:/diary";
	}
	
	//다이어리수정
	@RequestMapping(value = "/diaryModify", method = RequestMethod.GET)
	public String diaryModify(Model model, DiaryVO dvo) {
		model.addAttribute("detail", ds.detail(dvo));
		return "/diary/diaryModify";
	}
	
	@RequestMapping(value = "/diaryModify", method = RequestMethod.POST)
	public String diaryModify(DiaryVO dvo) {
		ds.modify(dvo);
		return "redirect:/diary";
	}
	
	//삭제
	@RequestMapping(value = "/diaryDelete", method = RequestMethod.GET)
	public String diaryDelete(DiaryVO dvo) {
		ds.delete(dvo);
		return "redirect:/diary";
	}
	//포도
		@RequestMapping(value = "/grape", method = RequestMethod.GET)
		public String grape(Model model, DiaryCriteriaVO cri) {
			int total = ds.total();
			model.addAttribute("total",total);
			return "/diary/grape";
		}
	
}
