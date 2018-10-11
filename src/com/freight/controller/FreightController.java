package com.freight.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.freight.pojo.Freight;
import com.freight.service.FreightService;
import com.freight.service.PositionService;
import com.freight.service.StrategyService;
import com.freight.service.impl.StrategyName;


@Controller
@RequestMapping("")
public class FreightController {
	
	@Autowired
	private PositionService positionService;
	
	@Autowired
	private FreightService freightService;
	
	@Qualifier("strategyName")
	private StrategyService strategyService;
	
	@RequestMapping("/home/search.name")
	public ModelAndView listCategory(String name){
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Freight> list= freightService.SearchFreightByName(name);
      mav.addObject("list", list);
      mav.addObject("hint", name);
      mav.setViewName("search");
      return mav;
	}
	
	@RequestMapping("/home/search.from")
	public ModelAndView listCategory1(String from){
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Freight> list= freightService.SearchFreightByFrom(from);
      mav.addObject("list", list);
      mav.addObject("hint1", from);
      mav.setViewName("search");
      return mav;
	}
	
	@RequestMapping("/home/search.to")
	public ModelAndView listCategory2(String to){
      ModelAndView mav = new ModelAndView();
      strategyService = new StrategyName();
      List<Freight> list= freightService.SearchFreightByTo(to);
      mav.addObject("list", list);
      mav.addObject("hint2", to);
      mav.setViewName("search");
      return mav;
	}
	
	@RequestMapping(value="/home/insert")
    public ModelAndView login(String f_name,String f_name_code,String f_from_city,String f_from_longitude,String f_from_latitude,String f_to_city,String f_to_longitude,String f_to_latitude,String f_total,String f_truck_num,String f_ton,ModelAndView mv,HttpSession session){
		 String f1 = f_name;
		 String f2 = f_name_code;
		 String f3 = f_from_city;
		 double f4 = positionService.getPosition(f_from_city).get(0).getLng();//Double.valueOf(f_from_longitude);
		 double f5 = positionService.getPosition(f_from_city).get(0).getLat();//Double.valueOf(f_from_latitude);
		 String f6 = f_to_city;
		 double f7 = positionService.getPosition(f_to_city).get(0).getLng();//Double.valueOf(f_to_longitude);;
		 double f8 = positionService.getPosition(f_to_city).get(0).getLat();//Double.valueOf(f_to_latitude);;
		 String f9 = f_total;
		 int f10 = Integer.valueOf(f_truck_num);
		 double f11 = Double.valueOf(f_ton);
		 Freight f = null;
		 try {
			String f111 = new String(f1.getBytes("ISO-8859-1"),"UTF-8");
			String f22 = new String(f2.getBytes("ISO-8859-1"),"UTF-8");
			String f33 = new String(f3.getBytes("ISO-8859-1"),"UTF-8");
			String f66 = new String(f6.getBytes("ISO-8859-1"),"UTF-8");
			String f99 = new String(f9.getBytes("ISO-8859-1"),"UTF-8");
			f = new Freight(f111, f22, f33, f4, f5, f66, f7, f8, f99, f10, f11);

		} catch (UnsupportedEncodingException e) {
			mv.addObject("message","Field does not meet requirements");
            mv.setViewName("skim");
            return mv;
		}
		f = new Freight(f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11);
        if(freightService.insertFreight(f)){
        	mv.addObject("tip","success to insert");
            mv.setViewName("skim");
        }else {
        	mv.addObject("message","fail to insert");
            mv.setViewName("skim");
        }
        return mv;
    }
	
}
