package com.studycafe.prac.dao;

import java.util.ArrayList;

import com.studycafe.prac.dto.Criteria;
import com.studycafe.prac.dto.memberDto;

public interface MemberDao {
	
	public int joinMember(String userId, String userPw, 
			String userName, String userPhone, String userEmail, String userPoint, String usingTicket);
	
	public int checkUserId(String userId);
	
	public int checkUserIdAndPw(String userId, String userPw);
	
	public memberDto getMemberInfo(String userId);
	
	public void memberModify(String userId, String userPw, String userName, String userPhone,
			String userEmail, String userPoint);
	
	public int memberDelete(String userPw);
	
	public void CheckId(String userId);
	
	public void updateUticketPoint(String userId, String userPoint, String usingTicket);
	
	public ArrayList<memberDto> getAllMemberInfo(Criteria cri);
	
	public int memberAllCount();
	
	public void admMemberKick(String userId);
	
	public int getUserIdCount(String userId);

}