package org.mini.service;

import java.util.ArrayList;

import org.mini.model.ilchonVO;

public interface ilchonService {
	public ArrayList<ilchonVO> list();

	public void write(ilchonVO ivo);

	public void delete(ilchonVO ivo);

}
