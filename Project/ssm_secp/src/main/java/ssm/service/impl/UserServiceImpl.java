package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.pojo.User;
import ssm.dao.IUserDao;
import ssm.service.IUserService;

import javax.annotation.Resource;

/**
 * 业务层
 * @author Nocol
 *
 */

@Service
public class UserServiceImpl implements IUserService {

    //
    @Autowired
    private IUserDao userDao;

    @Override
    public void regist(User user) {
        // TODO Auto-generated method stub
        //userDao.addUser(user);;
    }

//    @Override
//    public void login(String name, String password) {
//        // TODO Auto-generated method stub
//        userDao.findUserByNameAndPwd(name,password);
//    }
    @Override
    public User checkLogin(String name, String passwd) {

        User user = userDao.findByUsername(name);
        if(user != null && user.getPasswd().equals(passwd)){

            return user;
        }
        return null;
    }
}



