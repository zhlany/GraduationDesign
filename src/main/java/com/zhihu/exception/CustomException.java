package com.zhihu.exception;
/**
 * @ClassName: CustomException
 * @Description: 异常处理类
 * @Author: 蓝芝护
 * @Date: 2022/5/2
 * @return: null
 **/
public class CustomException extends Exception {

    public String message;

    public CustomException(String message){
        super(message);
        this.message = message;
    }


    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
