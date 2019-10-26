package com.h5.service.lm.impl;

import com.github.pagehelper.Page;
import com.h5.entity.LM3;
import com.h5.mapper.LM3Mapper;
import com.h5.service.lm.LM3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LM3ServiceImp implements LM3Service {

    @Autowired
    private LM3Mapper lm3Mapper;

    @Override
    public Page<LM3> list() {
        return lm3Mapper.list();
    }


    @Override
    public void update(LM3 lm3) {
        lm3Mapper.updateByPrimaryKeySelective(lm3);
    }


    @Override
    public void save(LM3 lm3) {
        lm3Mapper.insert(lm3);
    }


    @Override
    public LM3 addEdit(Long id) {
        return lm3Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm3Mapper.deleteByPrimaryKey(id);
    }
}
