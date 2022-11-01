package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoVO;

public interface PhotoMapper {

	// 글쓰기에 해당되는 DB작업 설계
	public void write(PhotoVO photo);

	// 게시글 목록 리스트에 해당되는 DB작업 설계
	public ArrayList<PhotoVO> list(CriteriaVO cri);

	// 목록리스트에서 제목을 클릭한 후 상세내용을 조회하는 DB작업 설계
	public PhotoVO detail(PhotoVO photo);

	// 상세내용에 해당되는 내용을 수정하는 DB작업 설계
	public void modify(PhotoVO photo);

	// 글 삭제 설계
	public void remove(PhotoVO photo);

	// board 전체 건수 설계
	public int total(CriteriaVO cri);

	public void like(PhotoVO photo);

	public void add_folder(PhotoFolderVO folder);

	public void modify_folder(PhotoFolderVO folder);

	public void delete_folder(PhotoFolderVO folder);

	public ArrayList<PhotoFolderVO> photo_folder();

}
