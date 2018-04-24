package ssm.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.dao.IUserDao;
import ssm.pojo.User;

import javax.annotation.Resource;

@Service
public class IUserService {

    //
    @Resource
    private IUserDao userDao;

//    @Override
//    public void regist(User user) {
//        // TODO Auto-generated method stub
//        //userDao.addUser(user);;
//    }


    public User checkLogin(String name, String passwd) {

        User user = this.userDao.findByUserName(name);
        if(user != null && user.getPassword().equals(passwd)){
            return user;
        }
        return null;
    }

    public User getUserById(int userId) {
        // TODO Auto-generated method stub
        return this.userDao.selectByPrimaryKey(userId);
    }
}
