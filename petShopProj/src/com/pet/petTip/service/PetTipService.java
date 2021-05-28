package com.pet.petTip.service;

import java.util.List;

import com.pet.petTip.vo.PetTipVO;

public interface PetTipService {
	// 반려동물 Tip 게시판 리스트 , 게시글 조회, 등록, 수정, 삭제
	
	List<PetTipVO> petTipSelectList();
	PetTipVO petTipSelect(PetTipVO vo);
	int insertPetTip(PetTipVO vo);
	int updatePetTip(PetTipVO vo);
	int deletePetTip(PetTipVO vo);
}
