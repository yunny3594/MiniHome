package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.HomeMapper;
import org.mini.model.HomeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeMapper hm;
	
	public int total_diary() {
		return hm.total_diary();
	}

	public int total_photo() {
		return hm.total_photo();
		
	}

	public int total_visit() {
		return hm.total_visit();		
	}

	public int update_diary() {
		return hm.update_diary();	
	}

	public int update_photo() {
		return hm.update_photo();	
	}

	public int update_visit() {
		return hm.update_visit();	
	}
	
	public ArrayList<HomeVO> update_news(){
		return hm.update_news();
	}


}
