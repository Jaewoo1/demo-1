package com.exam.pro.mapper;

import com.exam.pro.vo.UserInfoVO;

public interface UserInfoMapper {
	
	UserInfoVO selectUserInfoByUiId(UserInfoVO user);
	
	UserInfoVO selectUserInfo(UserInfoVO userInfo);

	int insertUserInfo(UserInfoVO user);
	
	int deleteUserInfo(int uiNum);
	
}
