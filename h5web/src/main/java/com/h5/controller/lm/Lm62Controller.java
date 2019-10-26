package com.h5.controller.lm;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.h5.entity.LM6;
import com.h5.entity.LM62;
import com.h5.service.lm.Lm62Service;
import com.h5.service.lm.Lm6Service;
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
@RequestMapping("lm62")
public class Lm62Controller {

    @Autowired
    private Lm62Service lm62Service;
    @RequestMapping("/list")
    public ModelAndView list(Integer pageNum, Integer pageSize) throws Exception {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        ModelAndView modelAndView = new ModelAndView("lm/lm62List");
        PageHelper.startPage(pageNum, pageSize);//分页
        Map<String, Object> dataMap = new HashMap<String, Object>();
        List<LM62> list = lm62Service.list();//开始查询
        PageInfo<LM62> pageInfo = new PageInfo<>(list);//封装page
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }
    @RequestMapping("/addOrUpdate")
    public ModelAndView addOrUpdate(Long id) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/lm/lm62Edit");

        if (null != id && !"".equals(id)) {
            //编辑
            LM62 lm62 = lm62Service.getById(id);
            modelAndView.addObject("lm", lm62);
        }
        //跳转到新增页面
        return modelAndView;
    }


    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public RespFormat saveOrUpdate(LM62 lm62) throws Exception {
//        String name = menu.getName();
        int i=0;
        try {

            Long id = lm62.getId();
            if(null != id && !"".equals(id)){
                //修改
               i=lm62Service.update(lm62);
            }else{
               i=lm62Service.save(lm62);
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
            LM62 lm62 = lm62Service.getById(id);
            if (null != lm62) {
                int i = lm62Service.del(id);
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
