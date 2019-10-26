package com.h5.service.lm;

import com.h5.entity.LM6;
import com.h5.entity.LM8;

import java.util.List;

public interface Lm8Service {
    List<LM8> list();

    LM8 getById(Long id);

    int del(Long id);

    int save(LM8 lm8);

    int update(LM8 lm8);
}
