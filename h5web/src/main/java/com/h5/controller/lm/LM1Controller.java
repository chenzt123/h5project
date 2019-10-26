package com.h5.controller.lm;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.h5.entity.LM1;
import com.h5.service.lm.LM1Service;
import com.h5.utils.QueryObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/lm1")
@Controller
public class LM1Controller {

    @Autowired
    private LM1Service lm1Service;

    /**
     * 列表
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(ModelAndView modelAndView, QueryObject queryObject){
        PageHelper.startPage(queryObject.getPageNum(),queryObject.getPageSize());
        Page<LM1> lm1s=lm1Service.list();
        PageInfo<LM1> pageInfo = new PageInfo<LM1>(lm1s);//封装page
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("/lm/lm1List");
        return modelAndView;
    }

    /**
     *跳转新增页面
     * @param modelAndView
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView add(ModelAndView modelAndView){
        modelAndView.setViewName("/lm/lm1Edit");
        return modelAndView;
    }

    /**
     *新增和编辑的保存功能
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    public void saveOrUpdate(LM1 lm1, HttpServletResponse response) throws IOException {
        response.setContentType("text/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String information = "成功";
        Boolean bit = true;
        JSONObject jsonObject = new JSONObject();
        //校验参数信息
        if (lm1 == null) {
            information = "关键信息不能为空哦";
            bit = false;
        } else if (!StringUtils.isNoneBlank(lm1.getDrawid(),lm1.getZodic(),lm1.getOpgame())) {
            information = "关键信息不能为空哦";
            bit = false;
        } else {
            if (lm1.getId()!=null){
                //修改
                lm1Service.update(lm1);
            }else {
                //插入
                lm1Service.save(lm1);
            }
        }
        jsonObject.put("information", information);
        jsonObject.put("success", bit);
        response.getWriter().print(jsonObject);
    }

    /**
     * 根据id查询对应Lm1数据,用于编辑页面回显
     * @param id
     * @return modelAndView
     */
    @RequestMapping("/addEdit")
    public ModelAndView addEdit(ModelAndView modelAndView,Long id){
        LM1 lm1=lm1Service.addEdit(id);
        modelAndView.addObject("lm1",lm1);
        modelAndView.setViewName("/lm/lm1Edit");
        return modelAndView;
    }


    /*@RequestMapping("/delete")
    public */

}
