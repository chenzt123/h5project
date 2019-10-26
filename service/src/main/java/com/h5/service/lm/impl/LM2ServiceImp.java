package com.h5.service.lm.impl;

import com.github.pagehelper.Page;
import com.h5.entity.LM2;
import com.h5.mapper.LM2Mapper;
import com.h5.service.lm.LM2Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LM2ServiceImp implements LM2Service {

    @Autowired
    private LM2Mapper lm2Mapper;

    @Override
    public Page<LM2> list() {
        return lm2Mapper.list();
    }


    @Override
    public void update(LM2 lm2) {
        lm2Mapper.updateByPrimaryKeySelective(lm2);
    }


    @Override
    public void save(LM2 lm2) {
        lm2Mapper.insert(lm2);
    }


    @Override
    public LM2 addEdit(Long id) {
        return lm2Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm2Mapper.deleteByPrimaryKey(id);
    }
}
