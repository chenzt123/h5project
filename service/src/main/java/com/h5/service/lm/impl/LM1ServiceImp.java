package com.h5.service.lm.impl;

import com.github.pagehelper.Page;
import com.h5.entity.LM1;
import com.h5.mapper.LM1Mapper;
import com.h5.service.lm.LM1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LM1ServiceImp implements LM1Service {

    @Autowired
    private LM1Mapper lm1Mapper;

    /**
     * 列表
     * @return
     */
    @Override
    public Page<LM1> list() {
        return lm1Mapper.list();
    }

    /**
     * 修改
     * @param lm1
     */
    @Override
    public void update(LM1 lm1) {
        lm1Mapper.updateByPrimaryKeySelective(lm1);
    }

    /**
     * 插入
     * @param lm1
     */
    @Override
    public void save(LM1 lm1) {
        lm1Mapper.insert(lm1);
    }

    /**
     * 根据id查询对应Lm1数据
     * @param id
     * @return
     */
    @Override
    public LM1 addEdit(Long id) {
        return lm1Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm1Mapper.deleteByPrimaryKey(id);
    }
}
