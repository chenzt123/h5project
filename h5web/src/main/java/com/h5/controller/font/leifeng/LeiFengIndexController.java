package com.h5.controller.font.leifeng;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/leifeng")
public class LeiFengIndexController {

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("font/leifeng/index");

        return modelAndView;
    }
}
