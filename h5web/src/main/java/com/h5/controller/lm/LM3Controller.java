package com.h5.controller.lm;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.h5.entity.LM3;
import com.h5.service.lm.LM3Service;
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

@RequestMapping("/lm3")
@Controller
public class LM3Controller {

    @Autowired
    private LM3Service lm3Service;

    /**
     * 列表
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(ModelAndView modelAndView, QueryObject queryObject){
        PageHelper.startPage(queryObject.getPageNum(),queryObject.getPageSize());
        Page<LM3> lm3s=lm3Service.list();
        PageInfo<LM3> pageInfo = new PageInfo<LM3>(lm3s);//封装page
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("/lm/lm3List");
        return modelAndView;
    }

    /**
     *跳转新增页面
     * @param modelAndView
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView add(ModelAndView modelAndView){
        modelAndView.setViewName("/lm/lm3Edit");
        return modelAndView;
    }

    /**
     *新增和编辑的保存功能
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    public void saveOrUpdate(LM3 lm3, HttpServletResponse response) throws IOException {
        response.setContentType("text/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String information = "成功";
        Boolean bit = true;
        JSONObject jsonObject = new JSONObject();
        //校验参数信息
        if (lm3 == null) {
            information = "关键信息不能为空哦";
            bit = false;
        } else if (!StringUtils.isNoneBlank(lm3.getDrawid(),lm3.getZodic(),lm3.getOpgame())) {
            information = "关键信息不能为空哦";
            bit = false;
        } else {
            if (lm3.getId()!=null){
                //修改
                lm3Service.update(lm3);
            }else {
                //插入
                lm3Service.save(lm3);
            }
        }
        jsonObject.put("information", information);
        jsonObject.put("success", bit);
        response.getWriter().print(jsonObject);
    }

    /**
     * 根据id查询对应Lm3数据,用于编辑页面回显
     * @param id
     * @return modelAndView
     */
    @RequestMapping("/addEdit")
    public ModelAndView addEdit(ModelAndView modelAndView,Long id){
        LM3 lm3=lm3Service.addEdit(id);
        modelAndView.addObject("lm3",lm3);
        modelAndView.setViewName("/lm/lm3Edit");
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
            LM3 lm3 = lm3Service.addEdit(id);
            if (null != lm3) {
                int i = lm3Service.del(id);
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
