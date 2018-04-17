package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.pojo.User;
import ssm.dao.IUserDao;
import ssm.service.IUserService;

/**
 * 业务层
 * @author Nocol
 *
 */

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public void regist(User user) {
        // TODO Auto-generated method stub
        userDao.addUser(user);
    }

    @Override
    public void login(String name, String password) {
        // TODO Auto-generated method stub
        userDao.findUserByNameAndPwd(name,password);
    }
}



