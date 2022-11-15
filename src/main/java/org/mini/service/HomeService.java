package org.mini.service;

import java.util.ArrayList;

import org.mini.model.HomeVO;

public interface HomeService {
	
	public int total_diary();

	public int total_photo();

	public int total_visit();

	public int update_diary();

	public int update_photo();

	public int update_visit();

	public ArrayList<HomeVO> update_news();
}
