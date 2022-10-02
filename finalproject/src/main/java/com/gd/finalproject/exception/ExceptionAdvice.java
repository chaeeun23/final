package com.gd.finalproject.exception;

import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionAdvice {

    @ExceptionHandler(BindException.class)
    public String handleNoSuchElementFoundException(BindException exception) {
        System.out.println("예외 나면 여기로 옴");
        return "/error/4xx";
    }

    @ExceptionHandler(Exception.class)
    public String exceptionHandler(Exception exception) {
        System.out.println("예외 나면 여기로 옴");
        return "/error/5xx";
    }

}
