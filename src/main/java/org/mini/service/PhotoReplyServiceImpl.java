package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.PhotoReplyMapper;
import org.mini.model.PhotoReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhotoReplyServiceImpl implements PhotoReplyService {
	@Autowired
	PhotoReplyMapper prm;

	public int rewrite(PhotoReplyVO reply) {
		return prm.rewrite(reply);
	}

	public ArrayList<PhotoReplyVO> list(int bno) {
		return prm.list(bno);
	}

	public int modify(PhotoReplyVO reply) {
		return prm.modify(reply);
	}

	public int remove(int rno) {
		return prm.remove(rno);
	}
}
