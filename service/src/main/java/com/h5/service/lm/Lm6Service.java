package com.h5.service.lm;

import com.h5.entity.LM6;

import java.util.List;

public interface Lm6Service {
    List<LM6> list();

    LM6 getById(Long id);

    int del(Long id);

    int save(LM6 lm6);

    int update(LM6 lm6);
}
