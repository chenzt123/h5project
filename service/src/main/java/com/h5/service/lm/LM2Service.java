package com.h5.service.lm;

import com.github.pagehelper.Page;
import com.h5.entity.LM2;

public interface LM2Service {

    Page<LM2> list();

    void update(LM2 lm2);

    void save(LM2 lm2);

    LM2 addEdit(Long id);

    int del(Long id);
}
