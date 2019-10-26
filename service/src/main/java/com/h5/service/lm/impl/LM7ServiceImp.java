package com.h5.service.lm.impl;

import com.h5.entity.LM62;
import com.h5.entity.LM7;
import com.h5.mapper.LM62Mapper;
import com.h5.mapper.LM7Mapper;
import com.h5.service.lm.Lm62Service;
import com.h5.service.lm.Lm7Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM7ServiceImp implements Lm7Service {

    @Autowired
    private LM7Mapper lm7Mapper;

    @Override
    public List<LM7> list() {
        return lm7Mapper.queryList();
    }

    @Override
    public LM7 getById(Long id) {
        return lm7Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm7Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM7 lm7) {
        return  lm7Mapper.insert(lm7);
    }

    @Override
    public int update(LM7 lm7) {
        return lm7Mapper.updateByPrimaryKey(lm7);
    }
}
