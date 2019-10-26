package com.h5.service.lm;

import com.h5.entity.LM52;

import java.util.List;

public interface Lm52Service {
    List<LM52> list();

    LM52 getById(Long id);

    int del(Long id);

    int save(LM52 lm52);

    int update(LM52 lm52);
}
