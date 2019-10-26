package com.h5.service.lm;

import com.github.pagehelper.Page;
import com.h5.entity.LM3;

public interface LM3Service {

    Page<LM3> list();

    void update(LM3 lm3);

    void save(LM3 lm3);

    LM3 addEdit(Long id);

    int del(Long id);
}
