package com.h5.service.lm.impl;

import com.h5.entity.LM6;
import com.h5.mapper.LM1Mapper;
import com.h5.mapper.LM6Mapper;
import com.h5.service.lm.Lm6Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM6ServiceImp implements Lm6Service {

    @Autowired
    private LM6Mapper lm6Mapper;

    @Override
    public List<LM6> list() {
        return lm6Mapper.queryList();
    }

    @Override
    public LM6 getById(Long id) {
        return lm6Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm6Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM6 lm6) {
        return  lm6Mapper.insert(lm6);
    }

    @Override
    public int update(LM6 lm6) {
        return lm6Mapper.updateByPrimaryKey(lm6);
    }
}
