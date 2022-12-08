package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.CriteriaVO;
import org.mini.model.VideoFolderVO;
import org.mini.model.VideoVO;

public interface VideoMapper {

	public void write(VideoVO video);

	public ArrayList<VideoVO> list(CriteriaVO cri);

	public ArrayList<VideoVO> detail(VideoVO video);

	public void modify(VideoVO video);

	public void remove(VideoVO video);

	public int total(CriteriaVO cri);

	public void add_folder(VideoFolderVO folder);

	public void modify_folder(VideoFolderVO folder);

	public void delete_folder(VideoFolderVO folder);

	public ArrayList<VideoFolderVO> video_folder();

}
