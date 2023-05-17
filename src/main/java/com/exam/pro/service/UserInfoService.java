package com.exam.pro.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.pro.mapper.UserInfoMapper;
import com.exam.pro.vo.UserInfoVO;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoMapper uiMapper;
	
	public boolean join(UserInfoVO user) {
		return uiMapper.insertUserInfo(user) == 1;
	}
	
	public UserInfoVO getUserInfoVOByUiId(UserInfoVO user) {
		return uiMapper.selectUserInfoByUiId(user);
	}

	public boolean login(UserInfoVO userInfo, HttpSession session) {
		UserInfoVO userInfos = uiMapper.selectUserInfo(userInfo);
		if(userInfos != null) {
			session.setAttribute("user", userInfos);
			return true;
		}
		return false;
	}
	
	public boolean delete(UserInfoVO user) {
		return uiMapper.insertUserInfo(user) == 1;
	}
	
}