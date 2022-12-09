package org.mini.service;

import java.util.ArrayList;

import org.mini.model.PhotoReplyVO;

public interface PhotoReplyService {
	public int rewrite(PhotoReplyVO reply);

	public ArrayList<PhotoReplyVO> list(int bno);

	public int modify(PhotoReplyVO reply);

	public int remove(int rno);
	
	public String replyid(int rno);
}
