package com.h5.service.lm.impl;

import com.h5.entity.LM5;
import com.h5.mapper.LM5Mapper;
import com.h5.service.lm.Lm5Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM5ServiceImp implements Lm5Service {

    @Autowired
    private LM5Mapper lm5Mapper;

    @Override
    public List<LM5> list() {
        return lm5Mapper.queryList();
    }

    @Override
    public LM5 getById(Long id) {
        return lm5Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm5Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM5 lm5) {
        return  lm5Mapper.insert(lm5);
    }

    @Override
    public int update(LM5 lm5) {
        return lm5Mapper.updateByPrimaryKey(lm5);
    }
}
