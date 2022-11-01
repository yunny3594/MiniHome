package org.mini.service;

import java.util.ArrayList;

import org.mini.model.AttachFileVO;
import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoVO;

public interface PhotoService {

	public void write(PhotoVO photo);

	public ArrayList<PhotoVO> list(CriteriaVO cri);

	public PhotoVO detail(PhotoVO photo);

	public void modify(PhotoVO photo);

	public void remove(PhotoVO photo);

	public int total(CriteriaVO cri);

	public void like(PhotoVO photo);

	public ArrayList<AttachFileVO> attachlist(int bno);

	public ArrayList<AttachFileVO> attachlist2(int bno);

	public void add_folder(PhotoFolderVO folder);

	public void modify_folder(PhotoFolderVO folder);

	public void delete_folder(PhotoFolderVO folder);

	public ArrayList<PhotoFolderVO> photo_folder();
}
