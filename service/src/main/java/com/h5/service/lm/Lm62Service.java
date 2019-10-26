package com.h5.service.lm;

import com.h5.entity.LM6;
import com.h5.entity.LM62;

import java.util.List;

public interface Lm62Service {
    List<LM62> list();

    LM62 getById(Long id);

    int del(Long id);

    int save(LM62 lm6);

    int update(LM62 lm6);
}
