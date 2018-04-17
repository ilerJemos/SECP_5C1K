package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ssm.pojo.User;
import ssm.service.IUserService;

import javax.servlet.http.HttpSession;

/**
 * 控制层
 * @author Nocol
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
    //注入Service
    @Autowired
    private IUserService userService;

    @RequestMapping("/regist")
    public String regist(User user,Model model){

        System.out.println("用户注册："+user.getName()+user.getPasswd());

        user.setId(1);
        userService.regist(user);

        model.addAttribute("msg", "注册成功");
        //注册成功后跳转success.jsp页面
        return "success";
    }

    @RequestMapping("/login")
    public String login(String name,String password,Model model){

        System.out.println("用户登录："+name+password);

		/*Map<String, String> map=new LinkedHashMap<String,String>();

		map.put("name", user.getName());
		map.put("password", user.getPassword());*/

        userService.login(name,password);

        model.addAttribute("msg", "登录成功");

        return "success";
    }

    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }
}

