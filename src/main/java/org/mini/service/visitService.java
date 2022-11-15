package org.mini.service;

import java.util.ArrayList;

import org.mini.model.visitVO;

public interface visitService {
	public void write(visitVO vvo);
	
	public void modify(visitVO vvo);

	public void delete(visitVO vvo);

	public ArrayList<visitVO> list();
	
	public int total();
}
