package org.mini.controller;

import org.mini.model.CriteriaVO;
import org.mini.model.VideoFolderVO;
import org.mini.model.VideoVO;
import org.mini.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VideoController {
	

	@Autowired
	VideoService vds;

	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video(Model model, CriteriaVO cri, VideoVO video, VideoFolderVO folder) {
//		model.addAttribute("list", ps.list(cri));
//		model.addAttribute("detail", ps.detail(photo));
//		int total = ps.total(cri);
//		model.addAttribute("paging", new PhotoPageVO(cri, total));
//		model.addAttribute("attach", ps.attachlist2(photo.getBno()));
//		model.addAttribute("folder", ps.photo_folder());

		return "/video/video";
	}
//
//	@RequestMapping(value = "/photoWrite", method = RequestMethod.GET)
//	public String photoyWrite(Model model, PhotoFolderVO folder) {
//		model.addAttribute("folder", ps.photo_folder());
//		return "/photo/photoWrite";
//	}
//
//	@RequestMapping(value = "/photoWrite", method = RequestMethod.POST)
//	public String photoWrite(PhotoVO photo) {
//		ps.write(photo);
//		return "redirect:/photo";
//	}
//
//	@RequestMapping(value = "/photoRemove", method = RequestMethod.GET)
//	public String photoRemove(PhotoVO photo) {
//		ps.remove(photo);
//		return "redirect:/photo";
//	}
//
//	@RequestMapping(value = "/photoModify", method = RequestMethod.GET)
//	public String photoModify(Model model, PhotoVO photo) {
//		model.addAttribute("detail", ps.detail(photo));
//		model.addAttribute("folder", ps.photo_folder());
//		return "/photo/photoModify";
//	}
//
//	@RequestMapping(value = "/photoModify", method = RequestMethod.POST)
//	public String photoModify(PhotoVO photo) {
//		ps.modify(photo);
//		return "redirect:/photo";
//	}
//
//	@RequestMapping(value = "/photoDetail", method = RequestMethod.GET)
//	public String photoDetail(Model model, PhotoVO photo) {
//		model.addAttribute("detail", ps.detail(photo));
//		return "/photo/photoDetail";
//	}
//
//	@RequestMapping(value = "/attachlist", method = RequestMethod.GET)
//	public ResponseEntity<ArrayList<AttachFileVO>> uploadAjaxPost(int bno) {
//		return new ResponseEntity<>(ps.attachlist(bno), HttpStatus.OK);
//	}
//
//	@RequestMapping(value = "/photoSetting", method = RequestMethod.GET)
//	public String photoSetting(Model model) {
//		model.addAttribute("photo_folder", ps.photo_folder());
//		return "/photo/photoSetting";
//	}
//
//	@RequestMapping(value = "/photoFolderAdd", method = RequestMethod.GET)
//	public String photoSetting(PhotoFolderVO folder) {
//		ps.add_folder(folder);
//		return "redirect:/photoSetting";
//	}
//
//	@RequestMapping(value = "/photoFolderModify", method = RequestMethod.GET)
//	public String photoFolderModify(PhotoFolderVO folder) {
//		ps.modify_folder(folder);
//		return "redirect:/photoSetting";
//	}
//
//	@RequestMapping(value = "/photoFolderDelete", method = RequestMethod.GET)
//	public String photoFolderDelete(PhotoFolderVO folder) {
//		ps.delete_folder(folder);
//		return "redirect:/photoSetting";
//	}

}
