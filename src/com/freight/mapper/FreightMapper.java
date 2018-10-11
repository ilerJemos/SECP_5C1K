package com.freight.mapper;


import java.util.List;

import com.freight.pojo.Freight;
import com.freight.pojo.Score;

public interface FreightMapper {
	public void insertFreight(Freight f);
	public List<Freight> SearchFreightByName(String str);
	public List<Freight> SearchFreightByFrom(String str);
	public List<Freight> SearchFreightByTo(String str);
	public List<Score> SearchScoreByName();
	public List<Score> SearchScoreByFrom();
	public List<Score> SearchScoreByTo();
}
