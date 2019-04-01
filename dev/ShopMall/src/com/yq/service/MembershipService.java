package com.yq.service;

import com.yq.dao.LevelDao;
import com.yq.dao.MembershipDao;
import com.yq.dao.OrderDao;
import com.yq.entity.Level;
import com.yq.entity.MemberLevel;
import com.yq.entity.Membership;
import com.yq.entity.Order;
import com.yq.util.DateUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MembershipService {
	@Autowired
	private MembershipDao membershipDao;
	@Autowired
	private LevelDao levelDao;

	@Autowired
	private OrderDao orderDao;

	public int insert(Map<String,Object> map ){
		return membershipDao.insert(map);
	}

	public int update(Map<String,Object> map ){
		return membershipDao.update(map);
	}
	public int updateWxbf(Map<String,Object> map ){
		return membershipDao.updateWxbf(map);
	}

	public int uparea(Map<String,Object> map ){
		return membershipDao.uparea(map);
	}

	public int upstatus(Map<String,Object> map){
		return membershipDao.upstatus(map);
	}


	public List<Membership> list(Membership membership){
		return membershipDao.list(membership);
	}
	public int count(Membership membership){
		return membershipDao.count(membership);
	}

	public List<Membership> listByIdForMemberShip(Membership membership){
		return membershipDao.listByIdForMemberShip(membership);
	}
	public List<Membership> listByReferee(Membership membership){
		return membershipDao.listByReferee(membership);
	}

	public int isMember(Membership membership){
		return membershipDao.isMember(membership);
	}

	/**
	 * 判断是否是会员
	 * 如果不是，返回null
	 * 如果是，返回折扣等等
	 * @param openId
	 * @return
	 */
	public HashMap<String,Object> getLevelDetailByLevelId(String openId){
		Membership queryMembership = new Membership();
		queryMembership.setOppen_id(openId);
		List<Membership> membershipList = this.listByIdForMemberShip(queryMembership);
		if (membershipList.size()!= 0) {
			//已经注册过会员
			//会员等级
			if(membershipList.get(0).getLevel()!=null){
				int membershipLevel = Integer.valueOf(membershipList.get(0).getLevel());
				//根据会员等级查询会员详细，查询折扣、累计购买时限等等
				Level queryMembershipLevel = new Level();
				queryMembershipLevel.setLevel_id(membershipLevel);
				List<Level> levelList = levelDao.list(queryMembershipLevel);
				//对应会员等级存在
				if(levelList.size()!=0){
					HashMap<String,Object> retMap = new HashMap<String,Object>();
					retMap.put("level_name",levelList.get(0).getLevel_name());
					retMap.put("once_cond",levelList.get(0).getOnce_cond());
					retMap.put("at_cond",levelList.get(0).getAt_cond());
					retMap.put("at_day",levelList.get(0).getAt_day());
					retMap.put("reduction",levelList.get(0).getReduction());
					return retMap;
				}else{//无该等级会员
					return null;
				}
			}else{
				return null;
			}
		}else{//未注册会员
			return null;
		}
	}

	public void updateMemberLevel(Order order, String oppen_id) {
		List<MemberLevel> levelList=membershipDao.getMemberLevelList();
		final Membership membership = membershipDao.selectMemberByOppenid(oppen_id);

		int level_id=levelList.get(levelList.size()-1).getLevel_id();
		if(StringUtils.isNotBlank(membership.getLevel())){
			level_id=Integer.valueOf(membership.getLevel());
		}

		for(MemberLevel level:levelList){
			if(level.getOnce_cond()>0){
				if(order.getGoods_total()>=level.getOnce_cond()){
					level_id=level_id>level.getLevel_id()? level.getLevel_id():level_id;
					break;
				}
			}
		}
		Map<String,Object> map=new HashMap<>();
		map.put("oppen_id",oppen_id);
		map.put("beginDate", DateUtil.addAnyDay(-365));
		map.put("endDate",DateUtil.addAnyDay(0));
		double totalMoney=orderDao.selectYearTotalMoney(map);

		for(MemberLevel level:levelList){
			if(level.getAt_cond()>0){
				if(totalMoney>=level.getAt_cond()){
					level_id=level_id>level.getLevel_id()? level.getLevel_id():level_id;
					break;
				}
			}
		}
		Membership mem=new Membership();
		mem.setOppen_id(oppen_id);
		mem.setLevel(String.valueOf(level_id));
		membershipDao.updateMemberLevel(mem);

	}

	public void updateAwardAndBalance(Order order, String oppen_id) {
		Long userID=membershipDao.selectUserIDByOppenID(oppen_id);
		for(int i=0;i<3;i++){
			userID=membershipDao.selectRefereeByOppenID(userID);
			if(userID==null){
				break;
			}
			Map<String,Object> map=new HashMap<>();
			map.put("userID",userID);
			map.put("orderID",order.getOrder_id());
			membershipDao.insertAwardDetail(map);
			membershipDao.updateMemBalance(map);
		}
	}

	public void updateIntegral(Order order, String oppen_id) {
		long userID=membershipDao.selectUserIDByOppenID(oppen_id);
		Map<String,Object> map=new HashMap<>();
		map.put("userID",userID);
		map.put("type_id",1);
		membershipDao.insertIntegralDetail(map);
		membershipDao.updateIntegral(map);
	}

    public long selectMemberIDByCode(String memberCode) {
		return membershipDao.selectMemberIDByCode(memberCode);
    }
}
