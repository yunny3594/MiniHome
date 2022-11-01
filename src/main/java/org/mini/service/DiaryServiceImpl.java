package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.DiaryMapper;
import org.mini.model.DiaryCriteriaVO;
import org.mini.model.DiaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryServiceImpl implements DiaryService {
	@Autowired
	DiaryMapper dm;

	public void write(DiaryVO dvo) {
		dm.write(dvo);
	}

	public void modify(DiaryVO dvo) {
		dm.modify(dvo);
	}

	public void delete(DiaryVO dvo) {
		dm.delete(dvo);
	}

	public ArrayList<DiaryVO> detail(DiaryVO dvo) {
		return dm.detail(dvo);
	}

	public ArrayList<DiaryVO> diary(DiaryCriteriaVO cri) {
		return dm.diary(cri);
	}
	public int total() {
		return dm.total();
	}
}
