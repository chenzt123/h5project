package com.h5.service.lm.impl;

import com.h5.entity.LM52;
import com.h5.mapper.LM52Mapper;
import com.h5.service.lm.Lm52Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM52ServiceImp implements Lm52Service {

    @Autowired
    private LM52Mapper lm52Mapper;

    @Override
    public List<LM52> list() {
        return lm52Mapper.queryList();
    }

    @Override
    public LM52 getById(Long id) {
        return lm52Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm52Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM52 lm52) {
        return  lm52Mapper.insert(lm52);
    }

    @Override
    public int update(LM52 lm52) {
        return lm52Mapper.updateByPrimaryKey(lm52);
    }
}
