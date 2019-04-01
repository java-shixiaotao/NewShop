package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.AddressDao;
import com.yq.entity.Address;

@Service
public class AddressService {
	@Autowired
	private AddressDao addressDao;

	public int insert(Map<String, Object> map) {
		return addressDao.insert(map);
	}

	public int update(Map<String, Object> map) {
		return addressDao.update(map);
	}
	
	public int delete(Map<String, Object> map) {
		return addressDao.delete(map);
	}

	public int sort(Map<String, Object> map) {
		return addressDao.sort(map);
	}

	public List<Address> list(Address address) {
		return addressDao.list(address);
	}
	
	public List<Address> listById(Address address) {
		return addressDao.listById(address);
	}
	
	public int count(Address address) {
		return addressDao.count(address);
	}

}
