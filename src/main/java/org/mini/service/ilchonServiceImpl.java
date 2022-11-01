package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.ilchonMapper;
import org.mini.model.ilchonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ilchonServiceImpl implements ilchonService {
	@Autowired
	ilchonMapper im;

	public ArrayList<ilchonVO> list() {
		return im.list();
	}

	public void write(ilchonVO ivo) {
		im.write(ivo);
	}

	public void delete(ilchonVO ivo) {
		im.delete(ivo);
	}
}
