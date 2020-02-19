package com.itheima.ssm.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderUtils {

    private static BCryptPasswordEncoder bCryptPasswordEncoder =new BCryptPasswordEncoder();
    public static   String  encodePassword(String password){
      return   bCryptPasswordEncoder.encode(password);
    }


    public static void  main(String[] args){
        String password="123";
        String pwd=encodePassword(password);
        //$2a$10$PtIr07As4ancV2noMw/m5eSB078UyAtDUduki4MrQW.dve.DxlB7S
        //$2a$10$/XN.7VZZK72LM909j4SMX.Yhol5GUScyWlJcpNSME029Le60nVWeu
        System.out.println(pwd);
    }
}
