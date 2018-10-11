package com.freight.service;

import java.util.List;

import com.freight.pojo.Freight;

public interface StrategyService {
	public List<Freight> searchFreight(String str);
}
