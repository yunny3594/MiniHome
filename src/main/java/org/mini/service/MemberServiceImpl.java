package org.mini.service;

import java.util.ArrayList;

import org.mini.mapper.MemberMapper;
import org.mini.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper mm;

	// 회원가입
	public void signup(MemberVO mvo) {
		mm.signup(mvo);
	}

	// 로그인
	public MemberVO login(MemberVO mvo) {
		return mm.login(mvo);
	}

	// 회원리스트
	public ArrayList<MemberVO> memberList() {
		return mm.memberList();
	}

	// 회원정보수정(개명,비밀번호변경)
	public void modify(MemberVO mvo) {
		mm.modify(mvo);
	}

	// 회원탈퇴
	public void remove(MemberVO mvo) {
		mm.remove(mvo);
	}

	// 회원상세내용보기/로그인(+세션)
	public MemberVO memberDetail(MemberVO mvo) {
		return mm.memberDetail(mvo);
	}

}
