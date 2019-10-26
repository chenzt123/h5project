package com.h5.service.lm;

import com.github.pagehelper.Page;
import com.h5.entity.LM1;

public interface LM1Service {
    /**
     * 列表
     * @return
     */
    Page<LM1> list();

    /**
     * 修改
     * @param lm1
     */
    void update(LM1 lm1);

    /**
     * 插入
     * @param lm1
     */
    void save(LM1 lm1);

    /**
     * 根据id查询对应Lm1数据
     * @param id
     * @return
     */
    LM1 addEdit(Long id);

    int del(Long id);
}
