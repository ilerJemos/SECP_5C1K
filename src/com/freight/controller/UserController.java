package com.freight.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.freight.pojo.User;
import com.freight.service.UserService;
import com.freight.util.HashUtil;
import com.freight.util.MailUtil;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	private UserService userService;
	
	private static String c;
	
	@RequestMapping(value="/freight")
    public ModelAndView login(String username,String p,ModelAndView mv,HttpSession session){
		HashUtil hash = new HashUtil();
		p = hash.hash(p, "SHA1");
        User user=userService.findUserByNameandPassword(username, p);
        if(user!=null){
            session.setAttribute("user", user);
            //mv.setView(new RedirectView("homepage"));
            mv.setViewName("homepage");
        }else {
            //mv.addObject("message","account error");
            mv.setViewName("no_user");
        }
        return mv;
    }
	
	@RequestMapping(value="/register")
	public ModelAndView register(String user,String passwd,String qq,ModelAndView mv,HttpSession session){
		if(!qq.equals(c)){
			mv.setViewName("codeerror");
			return mv;
		}
		
		HashUtil hash = new HashUtil();
		passwd = hash.hash(passwd, "SHA1");
        if(userService.registerUser(user, passwd)){
        	mv.setViewName("jump");
        }else{
        	mv.setViewName("registerfail");
        }
        return mv;
    }
	
	@RequestMapping(value="/mail")
	public ModelAndView mail(HttpServletRequest request,ModelAndView mv){
		MailUtil m = new MailUtil();
		int temp = (int)((Math.random()*9+1)*1000);
		String str = String .valueOf(temp);
		m.sendEmail(request.getParameter("id"),str);
		c=str;
		return mv;
    }
}
