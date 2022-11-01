package org.mini.service;

import java.util.ArrayList;

import org.mini.model.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void signup(MemberVO mvo);

	// 로그인
	public MemberVO login(MemberVO mvo);

	// 회원리스트
	public ArrayList<MemberVO> memberList();

	// 회원정보수정(개명,비밀번호변경)
	public void modify(MemberVO mvo);

	// 회원탈퇴
	public void remove(MemberVO mvo);
	
	// 회원상세내용보기/로그인(+세션)
	public MemberVO memberDetail(MemberVO mvo);
}
