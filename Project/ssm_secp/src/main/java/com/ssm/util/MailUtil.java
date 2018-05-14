package com.ssm.util;

import java.io.InputStreamReader;
import java.util.Properties;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
    public  boolean sendEmail(String emailaddress,String code){
        try {
            Properties properties = new Properties();
            properties.load(new InputStreamReader(MailUtil.class.getClassLoader().getResourceAsStream("mail.properties"), "UTF-8"));
            String hostname=properties.getProperty("hostname");
            String from=properties.getProperty("from");
            String from_title=properties.getProperty("from_title");
            String password=properties.getProperty("password");
            String to_head=properties.getProperty("to_head");
            String to_content=properties.getProperty("to_content");
            HtmlEmail email = new HtmlEmail();
            email.setHostName(hostname);
            email.setCharset("UTF-8");
            email.addTo(emailaddress);
            email.setFrom(from, from_title);
            email.setAuthentication(from, password);
            email.setSubject(to_head);
            email.setMsg(to_content + code);
            email.send();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
