package ssm.dao;

import org.apache.ibatis.annotations.Param;
import ssm.pojo.User;

/**
 * 持久层映射接口
 * @author Nocol
 *
 */
public interface IUserDao {

    //添加用户
    void addUser(User user);
    //用户登陆
    User findByUsername(String name);

    //根据用户名和密码查询用户
    //注解的两个参数会自动封装成map集合，括号内即为键
    void findUserByNameAndPwd(@Param("name") String name, @Param("passwd") String passwd);

}

