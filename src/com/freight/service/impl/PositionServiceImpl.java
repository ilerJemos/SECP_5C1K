package com.freight.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freight.mapper.PositionMapper;
import com.freight.pojo.Position;
import com.freight.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService{

	@Autowired
	PositionMapper positionMapper;
	
	@Override
	public List<Position> getPosition(String str) {
		return positionMapper.getPosition(str);
	}

}
