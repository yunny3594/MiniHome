package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.PhotoAttachMapper;
import org.mini.mapper.PhotoMapper;
import org.mini.model.AttachFileVO;
import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	PhotoMapper pm;
	@Autowired
	PhotoAttachMapper pam;

	public void write(PhotoVO photo) {
		pm.write(photo);
		photo.getAttach().forEach(attach -> {
			// AttachFileVO?ùò bno?óê BoardVO?ùò bnoÎ•? ???û•
			attach.setBno(photo.getBno());
			pam.insert(attach);
		});
	}

	public ArrayList<PhotoVO> list(CriteriaVO cri) {
		return pm.list(cri);
	}

	public PhotoVO detail(PhotoVO photo) {
		return pm.detail(photo);
	}

	public void modify(PhotoVO photo) {
		pm.modify(photo);
	}

	public void remove(PhotoVO photo) {
		pm.remove(photo);
	}

	public int total(CriteriaVO cri) {
		return pm.total(cri);
	}

	public void like(PhotoVO photo) {
		pm.like(photo);
	}

	public ArrayList<AttachFileVO> attachlist(int bno) {
		return pam.attachlist(bno);
	}

	public ArrayList<AttachFileVO> attachlist2(int bno) {
		return pam.attachlist2(bno);
	}

	public void add_folder(PhotoFolderVO folder) {
		pm.add_folder(folder);
	}
	
	public void modify_folder(PhotoFolderVO folder) {
		pm.modify_folder(folder);
	}

	public void delete_folder(PhotoFolderVO folder) {
		pm.delete_folder(folder);
	}


	public ArrayList<PhotoFolderVO> photo_folder(){
		return pm.photo_folder();
	}

}
