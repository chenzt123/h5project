package com.h5.service.lm;

import com.h5.entity.LM4;

import java.util.List;

public interface Lm4Service {
    List<LM4> list();

    LM4 getById(Long id);

    int del(Long id);

    int save(LM4 lm4);

    int update(LM4 lm4);
}
