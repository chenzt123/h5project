package com.h5.service.lm;

import com.h5.entity.LM5;

import java.util.List;

public interface Lm5Service {
    List<LM5> list();

    LM5 getById(Long id);

    int del(Long id);

    int save(LM5 lm5);

    int update(LM5 lm5);
}
