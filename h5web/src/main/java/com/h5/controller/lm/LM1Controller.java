package com.h5.controller.lm;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.h5.entity.LM1;
import com.h5.service.lm.LM1Service;
import com.h5.utils.QueryObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/lm1")
@Controller
public class LM1Controller {

    @Autowired
    private LM1Service lm1Service;

    /**
     * 列表
     * @return
     */
    public ModelAndView list(ModelAndView modelAndView, QueryObject queryObject){
        PageHelper.startPage(queryObject.getPageNum(),queryObject.getPageSize());
        Page<LM1> lm1s=lm1Service.list();
        PageInfo<LM1> pageInfo = new PageInfo<LM1>(lm1s);//封装page
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("lm1List");
        return modelAndView;
    }
}
