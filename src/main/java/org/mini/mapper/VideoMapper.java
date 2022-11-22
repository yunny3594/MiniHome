package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoVO;

public interface VideoMapper {

	// κΈ??°κΈ°μ ?΄?Ή?? DB?? ?€κ³?
	public void write(PhotoVO photo);

	// κ²μκΈ? λͺ©λ‘ λ¦¬μ€?Έ? ?΄?Ή?? DB?? ?€κ³?
	public ArrayList<PhotoVO> list(CriteriaVO cri);

	// λͺ©λ‘λ¦¬μ€?Έ?? ? λͺ©μ ?΄λ¦?? ? ??Έ?΄?©? μ‘°ν?? DB?? ?€κ³?
	public PhotoVO detail(PhotoVO photo);

	// ??Έ?΄?©? ?΄?Ή?? ?΄?©? ?? ?? DB?? ?€κ³?
	public void modify(PhotoVO photo);

	// κΈ? ?­?  ?€κ³?
	public void remove(PhotoVO photo);

	// board ? μ²? κ±΄μ ?€κ³?
	public int total(CriteriaVO cri);

	public void like(PhotoVO photo);

	public void add_folder(PhotoFolderVO folder);

	public void modify_folder(PhotoFolderVO folder);

	public void delete_folder(PhotoFolderVO folder);

	public ArrayList<PhotoFolderVO> photo_folder();

}
