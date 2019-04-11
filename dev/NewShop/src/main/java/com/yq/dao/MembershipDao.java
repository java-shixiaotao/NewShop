package com.yq.dao;

import com.yq.entity.Level;
import com.yq.entity.MemberLevel;
import com.yq.entity.Membership;

import java.util.List;
import java.util.Map;


public interface MembershipDao {

	public int insert(Map<String, Object> map);

	public int update(Map<String, Object> map);
	public int updateWxbf(Map<String, Object> map);

	public int uparea(Map<String, Object> map);

	public int upstatus(Map<String, Object> map);

	public List<Membership> list(Membership membership);

	public int count(Membership membership);

	public List<Membership> listByIdForMemberShip(Membership membership);
	public List<Membership> listByReferee(Membership membership);

	public int isMember(Membership membership);

	Membership selectMemberByOppenid(String oppen_id);

	List<MemberLevel> getMemberLevelList();

	void updateMemberLevel(Membership mem);

	long selectUserIDByOppenID(String oppen_id);

	Long selectRefereeByOppenID(long userID);

	void insertAwardDetail(Map<String, Object> map);

	void updateMemBalance(Map<String, Object> map);

	void insertIntegralDetail(Map<String, Object> map);

	void updateIntegral(Map<String, Object> map);

    long selectMemberIDByCode(String memberCode);
}
