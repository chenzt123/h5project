package com.h5.service.lm;

import com.h5.entity.LM6;
import com.h5.entity.LM7;

import java.util.List;

public interface Lm7Service {
    List<LM7> list();

    LM7 getById(Long id);

    int del(Long id);

    int save(LM7 lm7);

    int update(LM7 lm7);
}
