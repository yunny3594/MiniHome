package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.visitMapper;
import org.mini.model.visitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class visitServiceImpl implements visitService {
	@Autowired
	visitMapper vm;

	public void write(visitVO vvo) {
		vm.write(vvo);
	}

	public void modify(visitVO vvo) {
		vm.modify(vvo);
	}

	public void delete(visitVO vvo) {
		vm.delete(vvo);
	}

	public ArrayList<visitVO> list() {
		return vm.list();
	}

	public int total() {
		return vm.total();
	}
}
