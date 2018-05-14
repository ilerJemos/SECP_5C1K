package com.ssm.controller;

import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.util.HashUtil;
import com.ssm.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    private UserService userService;

    private static String c;

    @RequestMapping("/getUser")
    public String getUser(int id, HttpServletRequest request, Model model){
        request.setAttribute("admin",userService.getUser(id));
        model.addAttribute("admin",userService.getUser(id));
        return "userInfo";
    }
    @RequestMapping("/login")
    public ModelAndView login(String username, String p, ModelAndView mv, HttpSession session){
        //HashUtil hash = new HashUtil();
        //p = hash.hash(p, "SHA1");
        User user=userService.findUser(username, p);
        if(user!=null){
            session.setAttribute("user", user);
            //mv.setView(new RedirectView("homepage"));
            //mv.setViewName("homepage");
            mv.setViewName("map");
        }else {
            //mv.addObject("message","account error");
            mv.setViewName("no_user");
        }
        return mv;
    }
    @RequestMapping(value="/register")
    public ModelAndView register(String user,String passwd,String qq,ModelAndView mv,HttpSession session){
//        if(!qq.equals(c)){
//            mv.setViewName("codeerror");
//            return mv;
//        }
//        HashUtil hash = new HashUtil();
//        passwd = hash.hash(passwd, "SHA1");
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
