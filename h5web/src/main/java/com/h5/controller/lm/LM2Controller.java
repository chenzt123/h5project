package com.h5.controller.lm;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.h5.entity.LM2;
import com.h5.service.lm.LM2Service;
import com.h5.utils.QueryObject;
import com.h5.utils.RespFormat;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/lm2")
@Controller
public class LM2Controller {

    @Autowired
    private LM2Service lm2Service;

    /**
     * 列表
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(ModelAndView modelAndView, QueryObject queryObject){
        PageHelper.startPage(queryObject.getPageNum(),queryObject.getPageSize());
        Page<LM2> lm1s=lm2Service.list();
        PageInfo<LM2> pageInfo = new PageInfo<LM2>(lm1s);//封装page
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("/lm/lm2List");
        return modelAndView;
    }

    /**
     *跳转新增页面
     * @param modelAndView
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView add(ModelAndView modelAndView){
        modelAndView.setViewName("/lm/lm2Edit");
        return modelAndView;
    }

    /**
     *新增和编辑的保存功能
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    public void saveOrUpdate(LM2 lm2, HttpServletResponse response) throws IOException {
        response.setContentType("text/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String information = "成功";
        Boolean bit = true;
        JSONObject jsonObject = new JSONObject();
        //校验参数信息
        if (lm2 == null) {
            information = "关键信息不能为空哦";
            bit = false;
        } else if (!StringUtils.isNoneBlank(lm2.getDrawid(),lm2.getZodic(),lm2.getOpgame())) {
            information = "关键信息不能为空哦";
            bit = false;
        } else {
            if (lm2.getId()!=null){
                //修改
                lm2Service.update(lm2);
            }else {
                //插入
                lm2Service.save(lm2);
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
        LM2 lm2=lm2Service.addEdit(id);
        modelAndView.addObject("lm2",lm2);
        modelAndView.setViewName("/lm/lm2Edit");
        return modelAndView;
    }


    @RequestMapping("/delete")
    @ResponseBody
    public RespFormat deleteRole(Long id) {
        if (null == id || "".equals(id)) {
            return RespFormat.markError("删除异常");
        }
        //获取用户信息
        String msg = "";
        try {
            LM2 lm1 = lm2Service.addEdit(id);
            if (null != lm1) {
                int i = lm2Service.del(id);
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
