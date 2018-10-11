package com.freight.mapper;

import java.util.List;

import com.freight.pojo.Freight;

public interface StrategyMapper {
	public List<Freight> SearchFreightByName(String name);
	public List<Freight> SearchFreightByFrom(String from);
	public List<Freight> SearchFreightByTo(String to);
}
