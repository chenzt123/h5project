package com.h5.controller.font.leifeng;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/record")
@Controller
public class LeiFengRecordController {



    @RequestMapping("/list")
    public ModelAndView  list(ModelAndView modelAndView){
        modelAndView.setViewName("/font/leifeng/record");
        return modelAndView;
    }
}
