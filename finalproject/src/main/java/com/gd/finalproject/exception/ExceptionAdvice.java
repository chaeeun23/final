package com.gd.finalproject.exception;

import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionAdvice {

    @ExceptionHandler(BindException.class)
    public String handleNoSuchElementFoundException(BindException exception) {
        return "/error/4xx";
    }

    @ExceptionHandler(Exception.class)
    public String exceptionHandler(Exception exception, Model model) {
        System.out.println(exception);
        model.addAttribute("exception", exception);
        model.addAttribute("error", exception.getCause());
        return "/error/5xx";
    }

}
