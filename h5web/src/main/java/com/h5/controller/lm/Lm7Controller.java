package com.h5.controller.lm;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.h5.entity.LM62;
import com.h5.entity.LM7;
import com.h5.entity.LM8;
import com.h5.service.lm.Lm62Service;
import com.h5.service.lm.Lm7Service;
import com.h5.utils.RespFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("lm7")
public class Lm7Controller {

    @Autowired
    private Lm7Service lm7Service;
    @RequestMapping("/list")
    public ModelAndView list(Integer pageNum, Integer pageSize) throws Exception {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        ModelAndView modelAndView = new ModelAndView("lm/lm7List");
        PageHelper.startPage(pageNum, pageSize);//分页
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<LM7> list = lm7Service.list();//开始查询
        PageInfo<LM7> pageInfo = new PageInfo<>(list);//封装page
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }
    @RequestMapping("/addOrUpdate")
    public ModelAndView addOrUpdate(Long id) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/lm/lm7Edit");

        if (null != id && !"".equals(id)) {
            //编辑
            LM7 lm7 = lm7Service.getById(id);
            modelAndView.addObject("lm", lm7);
        }
        //跳转到新增页面
        return modelAndView;
    }


    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public RespFormat saveOrUpdate(LM7 lm7) throws Exception {
//        String name = menu.getName();
        int i=0;
        try {

            Long id = lm7.getId();
            if(null != id && !"".equals(id)){
                //修改
               i=lm7Service.update(lm7);
            }else{
               i=lm7Service.save(lm7);
            }
        }catch (Exception e){
            return RespFormat.markError("操作异常");
        }
        if(i==1){
            return RespFormat.markSuccess("操作成功");
        }else{
            return RespFormat.markError("操作失败");
        }
    }



    /**
     * 删除
     *
     * @param
     * @return
     * @throws Exception
     */

    @PostMapping("/delete")
    @ResponseBody
    public RespFormat deleteRole(Long id) {
        if (null == id || "".equals(id)) {
            return RespFormat.markError("删除异常");
        }

        //获取用户信息
        String msg = "";
        try {
            LM7 lm7 = lm7Service.getById(id);
            if (null != lm7) {
                int i = lm7Service.del(id);
                if (i == 0) {
                    msg = "删除失败";
                    return RespFormat.markError(msg);
                }
                msg = "删除成功";
            } else {
                msg = "用户异常";
            }
        } catch (Exception e) {
            msg = "删除失败";
        }
        return RespFormat.markSuccess(msg);
    }
}