package icu.liuwisdom.common.utils;

import org.springframework.stereotype.Component;


/*图片格式验证工具类*/
public class ImageFormatValidation {
    public static boolean FormatValidation(String name) {
        if (name.equalsIgnoreCase(".png") || name.equalsIgnoreCase(".image") || name.equalsIgnoreCase(".img") || name.equalsIgnoreCase(".jpg")) {
            return true;
        }
        return false;
    }
}
