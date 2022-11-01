package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.ilchonVO;

public interface ilchonMapper {

	public ArrayList<ilchonVO> list();

	public void write(ilchonVO ivo);

	public void delete(ilchonVO ivo);

}
