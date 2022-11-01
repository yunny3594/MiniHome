package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.AttachFileVO;

public interface PhotoAttachMapper {
	// 글쓰기할 당시에 첨부파일 DB작업 설계
	public void insert(AttachFileVO attach);

	// 해당게시물의 첨부파일 조회
	public ArrayList<AttachFileVO> attachlist(int bno);
	
	public ArrayList<AttachFileVO> attachlist2(int bno);

}
