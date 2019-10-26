package com.h5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @RequestMapping("index")
    public ModelAndView  index(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("index/index");
        return modelAndView;
    }
}
