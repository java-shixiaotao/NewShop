package com.weixin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.weixin.dao.ButtonMapper;
import com.weixin.entity.Button;

@Service
@Transactional
public class ButtonService {
	@Autowired
	private ButtonMapper buttonMapper;

	public int deleteByPrimaryKey(String id) {
		int rs = 0;
		try {
			rs = buttonMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			rs = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return rs;
	}

	public int insert(Button record) {
		int rs = 0;
		try {
			rs = buttonMapper.insert(record);
		} catch (Exception e) {
			rs = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return rs;
	}

	public Button selectByPrimaryKey(String id) {
		return buttonMapper.selectByPrimaryKey(id);
	}
	public int selectCount(Button record){
		return buttonMapper.selectCount(record);
	}
	public List<Button>  select(Button record) {
		return buttonMapper.select(record);
	}
	
	public int updateByPrimaryKey(Button record) {
		int rs = 0;
		try {
			rs = buttonMapper.updateByPrimaryKey(record);
		} catch (Exception e) {
			rs = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return rs;
	}
	
	public int updateByPrimaryKeySelective(Button record) {
		int rs = 0;
		try {
			rs = buttonMapper.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			rs = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return rs;
	}
	public int sort(Button record) {
		int rs = 0;
		try {
			rs = buttonMapper.sort(record);
		} catch (Exception e) {
			rs = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return rs;
	}
}
