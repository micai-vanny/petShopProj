package com.pet.member.service;

import java.util.List;

import com.pet.member.vo.MemberVO;

public interface MemberService {

	List<MemberVO>  selectMemberList();
	MemberVO selectMember(String id);
	public int insertMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo);
	
}
