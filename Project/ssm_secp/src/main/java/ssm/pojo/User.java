package ssm.pojo;

import org.springframework.stereotype.Component;

@Component
public class User {
    private String name;
    private String passwd;
    private int id;
    public void setName(String name){
        this.name=name;
    }
    public void setPasswd(String passwd){
        this.passwd=passwd;
    }
    public void setId(int id){
        this.id=id;
    }
    public String getName(){
        return name;
    }
    public String  getPasswd(){
        return passwd;
    }
    public int getId(){
        return id;
    }

}
