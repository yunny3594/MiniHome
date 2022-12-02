package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.VideoMapper;
import org.mini.model.CriteriaVO;
import org.mini.model.VideoFolderVO;
import org.mini.model.VideoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	VideoMapper vdm;


	public void write(VideoVO video) {
		vdm.write(video);

	}

	public ArrayList<VideoVO> list(CriteriaVO cri){
		return vdm.list(cri);
		
	}

	public void modify(VideoVO video) {
		vdm.modify(video);
	}

	public void remove(VideoVO video) {
		vdm.remove(video);
	}

	public int total(CriteriaVO cri) {
		return vdm.total(cri);
	}

	public void add_folder(VideoFolderVO folder) {
		vdm.add_folder(folder);
	}

	public void modify_folder(VideoFolderVO folder) {
		vdm.modify_folder(folder);
	}

	public void delete_folder(VideoFolderVO folder) {
		vdm.delete_folder(folder);
	}

	public ArrayList<VideoFolderVO> video_folder(){
		return vdm.video_folder();
	}

}
