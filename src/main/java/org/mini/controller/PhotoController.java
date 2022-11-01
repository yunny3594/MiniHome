package org.mini.controller;

import java.util.ArrayList;

import org.mini.model.AttachFileVO;
import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoPageVO;
import org.mini.model.PhotoVO;
import org.mini.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PhotoController {
	

	@Autowired
	PhotoService ps;

	// ☆사진첩☆
	@RequestMapping(value = "/photo", method = RequestMethod.GET)
	public String photo(Model model, CriteriaVO cri, PhotoVO photo, PhotoFolderVO folder) {
		model.addAttribute("list", ps.list(cri));
		model.addAttribute("detail", ps.detail(photo));
		int total = ps.total(cri);
		model.addAttribute("paging", new PhotoPageVO(cri, total));
		model.addAttribute("attach", ps.attachlist2(photo.getBno()));
		model.addAttribute("folder", ps.photo_folder());

		return "photo";
	}

	// 사진첩 글쓰기
	@RequestMapping(value = "/photoWrite", method = RequestMethod.GET)
	public String photoyWrite(Model model, PhotoFolderVO folder) {
		model.addAttribute("folder", ps.photo_folder());
		return "photoWrite";
	}

	@RequestMapping(value = "/photoWrite", method = RequestMethod.POST)
	public String photoWrite(PhotoVO photo) {
		ps.write(photo);
		return "redirect:/photo";
	}

	// 사진첩 삭제
	@RequestMapping(value = "/photoRemove", method = RequestMethod.GET)
	public String photoRemove(PhotoVO photo) {
		ps.remove(photo);
		return "redirect:/photo";
	}

	// 사진첩 수정
	@RequestMapping(value = "/photoModify", method = RequestMethod.GET)
	public String photoModify(Model model, PhotoVO photo) {
		model.addAttribute("detail", ps.detail(photo));
		model.addAttribute("folder", ps.photo_folder());
		return "photoModify";
	}

	@RequestMapping(value = "/photoModify", method = RequestMethod.POST)
	public String photoModify(PhotoVO photo) {
		ps.modify(photo);
		return "redirect:/photo";
	}

	// 사진첩 디테일
	@RequestMapping(value = "/photoDetail", method = RequestMethod.GET)
	public String photoDetail(Model model, PhotoVO photo) {
		model.addAttribute("detail", ps.detail(photo));
		return "photoDetail";
	}

	// 해당게시물의 첨부파일의 데이터를 ajax로 전송
	@RequestMapping(value = "/attachlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<AttachFileVO>> uploadAjaxPost(int bno) {
		return new ResponseEntity<>(ps.attachlist(bno), HttpStatus.OK);
	}

	@RequestMapping(value = "/photoSetting", method = RequestMethod.GET)
	public String photoSetting(Model model) {
		model.addAttribute("photo_folder", ps.photo_folder());
		return "photoSetting";
	}

	@RequestMapping(value = "/photoFolderAdd", method = RequestMethod.GET)
	public String photoSetting(PhotoFolderVO folder) {
		ps.add_folder(folder);
		return "redirect:/photoSetting";
	}

	@RequestMapping(value = "/photoFolderModify", method = RequestMethod.GET)
	public String photoFolderModify(PhotoFolderVO folder) {
		ps.modify_folder(folder);
		return "redirect:/photoSetting";
	}

	@RequestMapping(value = "/photoFolderDelete", method = RequestMethod.GET)
	public String photoFolderDelete(PhotoFolderVO folder) {
		ps.delete_folder(folder);
		return "redirect:/photoSetting";
	}

}
