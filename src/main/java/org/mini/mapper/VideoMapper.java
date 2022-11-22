package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoVO;

public interface VideoMapper {

	// �??��기에 ?��?��?��?�� DB?��?�� ?���?
	public void write(PhotoVO photo);

	// 게시�? 목록 리스?��?�� ?��?��?��?�� DB?��?�� ?���?
	public ArrayList<PhotoVO> list(CriteriaVO cri);

	// 목록리스?��?��?�� ?��목을 ?���??�� ?�� ?��?��?��?��?�� 조회?��?�� DB?��?�� ?���?
	public PhotoVO detail(PhotoVO photo);

	// ?��?��?��?��?�� ?��?��?��?�� ?��?��?�� ?��?��?��?�� DB?��?�� ?���?
	public void modify(PhotoVO photo);

	// �? ?��?�� ?���?
	public void remove(PhotoVO photo);

	// board ?���? 건수 ?���?
	public int total(CriteriaVO cri);

	public void like(PhotoVO photo);

	public void add_folder(PhotoFolderVO folder);

	public void modify_folder(PhotoFolderVO folder);

	public void delete_folder(PhotoFolderVO folder);

	public ArrayList<PhotoFolderVO> photo_folder();

}
