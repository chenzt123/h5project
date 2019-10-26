package com.h5.service.lm.impl;

import com.h5.entity.LM4;
import com.h5.mapper.LM4Mapper;
import com.h5.service.lm.Lm4Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LM4ServiceImp implements Lm4Service {

    @Autowired
    private LM4Mapper lm4Mapper;

    @Override
    public List<LM4> list() {
        return lm4Mapper.queryList();
    }

    @Override
    public LM4 getById(Long id) {
        return lm4Mapper.selectByPrimaryKey(id);
    }

    @Override
    public int del(Long id) {
        return lm4Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(LM4 lm4) {
        return  lm4Mapper.insert(lm4);
    }

    @Override
    public int update(LM4 lm4) {
        return lm4Mapper.updateByPrimaryKey(lm4);
    }
}
