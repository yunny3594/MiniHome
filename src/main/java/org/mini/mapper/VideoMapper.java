package org.mini.mapper;

import java.util.ArrayList;

import org.mini.model.CriteriaVO;
import org.mini.model.PhotoFolderVO;
import org.mini.model.PhotoVO;

public interface VideoMapper {

	// ê¸??“°ê¸°ì— ?•´?‹¹?˜?Š” DB?‘?—… ?„¤ê³?
	public void write(PhotoVO photo);

	// ê²Œì‹œê¸? ëª©ë¡ ë¦¬ìŠ¤?Š¸?— ?•´?‹¹?˜?Š” DB?‘?—… ?„¤ê³?
	public ArrayList<PhotoVO> list(CriteriaVO cri);

	// ëª©ë¡ë¦¬ìŠ¤?Š¸?—?„œ ? œëª©ì„ ?´ë¦??•œ ?›„ ?ƒ?„¸?‚´?š©?„ ì¡°íšŒ?•˜?Š” DB?‘?—… ?„¤ê³?
	public PhotoVO detail(PhotoVO photo);

	// ?ƒ?„¸?‚´?š©?— ?•´?‹¹?˜?Š” ?‚´?š©?„ ?ˆ˜? •?•˜?Š” DB?‘?—… ?„¤ê³?
	public void modify(PhotoVO photo);

	// ê¸? ?‚­? œ ?„¤ê³?
	public void remove(PhotoVO photo);

	// board ? „ì²? ê±´ìˆ˜ ?„¤ê³?
	public int total(CriteriaVO cri);

	public void like(PhotoVO photo);

	public void add_folder(PhotoFolderVO folder);

	public void modify_folder(PhotoFolderVO folder);

	public void delete_folder(PhotoFolderVO folder);

	public ArrayList<PhotoFolderVO> photo_folder();

}
