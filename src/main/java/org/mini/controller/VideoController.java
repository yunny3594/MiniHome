package org.mini.controller;

import org.mini.model.CriteriaVO;
import org.mini.model.VideoFolderVO;
import org.mini.model.VideoPageVO;
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
		model.addAttribute("list", vds.list(cri));
//		model.addAttribute("detail", vds.detail(video));
		int total = vds.total(cri);
		model.addAttribute("paging", new VideoPageVO(cri, total));
		model.addAttribute("folder", vds.video_folder());

		return "/video/video";
	}
//
	@RequestMapping(value = "/videoWrite", method = RequestMethod.GET)
	public String videoyWrite(Model model, VideoFolderVO folder) {
		model.addAttribute("folder", vds.video_folder());
		return "/video/videoWrite";
	}

	@RequestMapping(value = "/videoWrite", method = RequestMethod.POST)
	public String videoWrite(VideoVO video) {
		vds.write(video);
		return "redirect:/video";
	}

//	@RequestMapping(value = "/videoRemove", method = RequestMethod.GET)
//	public String videoRemove(VideoVO video) {
//		vds.remove(video);
//		return "redirect:/video";
//	}
//
//	@RequestMapping(value = "/videoModify", method = RequestMethod.GET)
//	public String videoModify(Model model, VideoVO video) {
//		model.addAttribute("detail", vds.detail(video));
//		model.addAttribute("folder", vds.video_folder());
//		return "/video/videoModify";
//	}
//
//	@RequestMapping(value = "/videoModify", method = RequestMethod.POST)
//	public String videoModify(VideoVO video) {
//		vds.modify(video);
//		return "redirect:/video";
//	}

	@RequestMapping(value = "/videoSetting", method = RequestMethod.GET)
	public String videoSetting(Model model) {
		model.addAttribute("video_folder", vds.video_folder());
		return "/video/videoSetting";
	}

	@RequestMapping(value = "/videoFolderAdd", method = RequestMethod.GET)
	public String videoSetting(VideoFolderVO folder) {
		vds.add_folder(folder);
		return "redirect:/video";
	}

	@RequestMapping(value = "/videoFolderModify", method = RequestMethod.GET)
	public String videoFolderModify(VideoFolderVO folder) {
		vds.modify_folder(folder);
		return "redirect:/video";
	}

	@RequestMapping(value = "/videoFolderDelete", method = RequestMethod.GET)
	public String videoFolderDelete(VideoFolderVO folder) {
		vds.delete_folder(folder);
		return "redirect:/video";
	}

}
