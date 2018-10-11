package com.freight.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freight.mapper.StrategyMapper;
import com.freight.pojo.Freight;
import com.freight.service.StrategyService;

@Service("strategyName")
public class StrategyName implements StrategyService{

	
	@Autowired
	StrategyMapper strategyMapper;
	
	@Override
	public List<Freight> searchFreight(String str) {
		return strategyMapper.SearchFreightByName(str);
	}

}
