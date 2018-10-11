package com.freight.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.freight.pojo.Freight;
import com.freight.service.FreightService;
import com.freight.service.StrategyService;
import com.freight.service.impl.StrategyName;

@Controller
@RequestMapping("")
public class MapController {
	@Autowired
	private FreightService freightService;
	
	@Qualifier("strategyName")
	private StrategyService strategyService;
	
	@RequestMapping("/home/showmap.name")
	public ModelAndView listCategory(String name ,String pos){
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Freight> list= freightService.SearchFreightByName(name);
      JSONArray array=new JSONArray();
      if(pos.equals("from_pos")) {
    	  for(int i=0;i<list.size();i++) {
        	  JSONObject json= new JSONObject();
        	  json.put("lng", list.get(i).getF_from_longitude());
        	  json.put("lat", list.get(i).getF_from_latitude());
        	  json.put("count", list.get(i).getF_ton()*100);
        	  array.add(json);
          }
      }else 
      {
    	  for(int i=0;i<list.size();i++) {
        	  JSONObject json= new JSONObject();
        	  json.put("lng", list.get(i).getF_to_longitude());
        	  json.put("lat", list.get(i).getF_to_latitude());
        	  json.put("count", list.get(i).getF_ton()*100);
        	  array.add(json);
    	  }
      }
      mav.addObject("list", array);
      mav.addObject("hint", name);
      mav.setViewName("showmap");
      return mav;
	}
	
	@RequestMapping("/home/showmap.from")
	public ModelAndView listCategory1(String from){
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Freight> list= freightService.SearchFreightByFrom(from);
      JSONArray array=new JSONArray();
      for(int i=0;i<list.size();i++) {
    	  JSONObject json= new JSONObject();
    	  json.put("lng", list.get(i).getF_to_longitude());
    	  json.put("lat", list.get(i).getF_to_latitude());
    	  json.put("count", list.get(i).getF_ton()*100);
    	  array.add(json);
      }
      mav.addObject("list", array);
      mav.addObject("hint1", from);
      mav.setViewName("showmap");
      return mav;
	}
	
	@RequestMapping("/home/showmap.to")
	public ModelAndView listCategory2(String to){
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Freight> list= freightService.SearchFreightByTo(to);
      JSONArray array=new JSONArray();
      for(int i=0;i<list.size();i++) {
    	  JSONObject json= new JSONObject();
    	  json.put("lng", list.get(i).getF_from_longitude());
    	  json.put("lat", list.get(i).getF_from_latitude());
    	  json.put("count", list.get(i).getF_ton()*100);
    	  array.add(json);
      }
      mav.addObject("list", array);
      mav.addObject("hint2", to);
      mav.setViewName("showmap");
      return mav;
	}
}
