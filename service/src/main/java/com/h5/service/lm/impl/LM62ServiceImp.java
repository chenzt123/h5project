package com.h5.service.lm.impl;

import com.h5.entity.LM6;
import com.h5.entity.LM62;
import com.h5.mapper.LM62Mapper;
import com.h5.mapper.LM6Mapper;
import com.h5.service.lm.Lm62Service;
import com.h5.service.lm.Lm6Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM62ServiceImp implements Lm62Service {

    @Autowired
    private LM62Mapper lm62Mapper;

    @Override
    public List<LM62> list() {
        return lm62Mapper.queryList();
    }

    @Override
    public LM62 getById(Long id) {
        return lm62Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm62Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM62 lm62) {
        return  lm62Mapper.insert(lm62);
    }

    @Override
    public int update(LM62 lm62) {
        return lm62Mapper.updateByPrimaryKey(lm62);
    }
}
