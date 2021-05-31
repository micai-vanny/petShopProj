package com.pet.petTip.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;

public class PetTipForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "petTip/petTipForm.tiles";
	}

}
