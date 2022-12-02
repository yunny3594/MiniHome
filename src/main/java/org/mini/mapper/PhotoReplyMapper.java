package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.PhotoReplyVO;

public interface PhotoReplyMapper {
	// 댓글 쓰기를 구현
	// return타입이 int 일 때 1이면 insert 성공, 0이면 실패
	public int rewrite(PhotoReplyVO reply);

	// 댓글목록리스트를 구현
	public ArrayList<PhotoReplyVO> list(int bno);

	// 댓글 수정을 구현
	public int modify(PhotoReplyVO reply);
	
	// 댓글 삭제를 구현
	public int remove(int rno);
}
