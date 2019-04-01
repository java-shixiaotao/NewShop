package com.yq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yq.dao.BannerDao;
import com.yq.entity.Banner;

@Service
public class BannerService {
	@Autowired
	private BannerDao bannerDao;

	public int insert(Map<String, Object> map) {
		return bannerDao.insert(map);
	}

	public int update(Map<String, Object> map) {
		return bannerDao.update(map);
	}

	public int upstatus(Map<String, Object> map) {
		return bannerDao.upstatus(map);
	}

	public int sort(Map<String, Object> map) {
		return bannerDao.sort(map);
	}

	public List<Banner> list(Banner banner) {
		return bannerDao.list(banner);
	}

	public List<Banner> listById(Banner banner) {
		return bannerDao.listById(banner);
	}
}
