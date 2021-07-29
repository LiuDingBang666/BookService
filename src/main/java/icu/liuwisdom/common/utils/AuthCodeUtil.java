package icu.liuwisdom.common.utils;

import java.util.Random;

/*随机生成验证码工具类*/
public class AuthCodeUtil {
    public static String getCode() {
        return String.valueOf(new Random().nextInt(500000) + 500000);
    }
}
