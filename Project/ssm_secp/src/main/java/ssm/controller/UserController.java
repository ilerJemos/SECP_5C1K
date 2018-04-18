package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import ssm.pojo.User;
import ssm.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 控制层
 * @author Nocol
 *
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
    //注入Service
    @Autowired
    private IUserService userService;

    //正常访问login页面
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/regist")
    public String regist(User user,Model model){

        System.out.println("用户注册："+user.getName()+user.getPasswd());

        //user.setId(1);
        //userService.regist(user);

        //model.addAttribute("msg", "注册成功");
        //注册成功后跳转success.jsp页面
        return "success";
    }

    //表单提交过来的路径
    @RequestMapping("/checkLogin")
    public String checkLogin(User user,Model model){
        //调用service方法
        user = userService.checkLogin(user.getName(), user.getPasswd());
        //若有user则添加到model里并且跳转到成功页面
        if(user != null){
            model.addAttribute("user",user);
            return "success";
        }
        return "fail";
    }


    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }

    //测试超链接跳转到另一个页面是否可以取到session值
    @RequestMapping("/anotherpage")
    public String hrefpage(){
        return "anotherpage";
    }
}

