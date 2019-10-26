package com.h5.service.lm.impl;

import com.h5.entity.LM62;
import com.h5.entity.LM8;
import com.h5.mapper.LM62Mapper;
import com.h5.mapper.LM8Mapper;
import com.h5.service.lm.Lm62Service;
import com.h5.service.lm.Lm8Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM8ServiceImp implements Lm8Service {

    @Autowired
    private LM8Mapper lm8Mapper;

    @Override
    public List<LM8> list() {
        return lm8Mapper.queryList();
    }

    @Override
    public LM8 getById(Long id) {
        return lm8Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm8Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM8 lm8) {
        return  lm8Mapper.insert(lm8);
    }

    @Override
    public int update(LM8 lm8) {
        return lm8Mapper.updateByPrimaryKey(lm8);
    }
}
