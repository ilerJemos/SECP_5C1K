package com.freight.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freight.mapper.FreightMapper;
import com.freight.pojo.Freight;
import com.freight.pojo.Score;
import com.freight.service.FreightService;

@Service
public class FreightServiceImpl implements FreightService {

	@Autowired
	FreightMapper freightMapper;
	@Override
	public boolean insertFreight(Freight f) {
		try{
			freightMapper.insertFreight(f);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	@Override
	public List<Freight> SearchFreightByName(String str) {
		return freightMapper.SearchFreightByName(str);
	}

	@Override
	public List<Freight> SearchFreightByFrom(String str) {
		return freightMapper.SearchFreightByFrom(str);
	}

	@Override
	public List<Freight> SearchFreightByTo(String str) {
		return freightMapper.SearchFreightByTo(str);
	}
	
	@Override
	public List<Score> SearchScoreByName() {
		return freightMapper.SearchScoreByName();
	}

	@Override
	public List<Score> SearchScoreByFrom() {
		return freightMapper.SearchScoreByFrom();
	}

	@Override
	public List<Score> SearchScoreByTo() {
		return freightMapper.SearchScoreByTo();
	}
}
