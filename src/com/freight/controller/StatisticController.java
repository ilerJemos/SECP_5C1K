package com.freight.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.freight.pojo.Score;
import com.freight.service.FreightService;
import com.freight.service.StrategyService;
import com.freight.service.impl.StrategyName;

@Controller
@RequestMapping("")
public class StatisticController {
	@Autowired
	private FreightService statisticService;
	
	@Qualifier("strategyName")
	private StrategyService strategyService;
	
	@RequestMapping("/home/statistic.name")
	public ModelAndView listCategory(String name ,String pos){
	  double sum = 0;
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Score> list= statisticService.SearchScoreByName();
      JSONArray array=new JSONArray();
      for(int i=0;i<list.size();i++) {
    	  sum +=list.get(i).getNum();
      }
      for(int i=0;i<list.size();i++) {
    	  double tmp = list.get(i).getNum();
    	  list.get(i).setNum(tmp/sum);
    	  JSONObject json= new JSONObject();
    	  json.put("name", list.get(i).getName());
    	  json.put("num", list.get(i).getNum());
    	  array.add(json);
      }
      mav.addObject("list", array);
      mav.setViewName("skim");
      return mav;
	}
	
	@RequestMapping("/home/statistic.from")
	public ModelAndView listCategory1(String from){
	  double sum = 0;
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Score> list= statisticService.SearchScoreByFrom();
      JSONArray array=new JSONArray();
      for(int i=0;i<list.size();i++) {
    	  sum +=list.get(i).getNum();
      }
      for(int i=0;i<list.size();i++) {
    	  double tmp = list.get(i).getNum();
    	  list.get(i).setNum(tmp/sum);
    	  JSONObject json= new JSONObject();
    	  json.put("name", list.get(i).getName());
    	  json.put("num", list.get(i).getNum());
    	  array.add(json);
      }
      mav.addObject("list", array);
      mav.addObject("hint1", from);
      mav.setViewName("skim");
      return mav;
	}
	
	@RequestMapping("/home/statistic.to")
	public ModelAndView listCategory2(String to){
	  double sum = 0;
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Score> list= statisticService.SearchScoreByTo();
      JSONArray array=new JSONArray();
      for(int i=0;i<list.size();i++) {
    	  sum +=list.get(i).getNum();
      }
      for(int i=0;i<list.size();i++) {
    	  double tmp = list.get(i).getNum();
    	  list.get(i).setNum(tmp/sum);
    	  JSONObject json= new JSONObject();
    	  json.put("name", list.get(i).getName());
    	  json.put("num", list.get(i).getNum());
    	  array.add(json);
      }
      mav.addObject("list", array);
      mav.addObject("hint2", to);
      mav.setViewName("skim");
      return mav;
	}
}
