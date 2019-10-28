package com.h5.controller.font.leifeng;

import com.h5.service.leifont.GameDrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/leifeng")
public class LeiFengIndexController {
    @Autowired
    private GameDrawService gameDrawService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("font/leifeng/index");
        Map<String,Object> map = gameDrawService.getIndexNextDate();
        modelAndView.addObject("nextMap",map);
        return modelAndView;
    }
}
