package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.DiaryCriteriaVO;
import org.mini.model.DiaryVO;

public interface DiaryMapper {
	
	public void write(DiaryVO dvo);

	public void modify(DiaryVO dvo);

	public void delete(DiaryVO dvo);
	
	public ArrayList<DiaryVO> detail(DiaryVO dvo);

	public ArrayList<DiaryVO> diary(DiaryCriteriaVO cri);
	
	public int total();

}
