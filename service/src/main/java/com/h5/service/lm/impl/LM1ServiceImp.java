package com.h5.service.lm.impl;

import com.h5.mapper.LM1Mapper;
import com.h5.service.lm.LM1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LM1ServiceImp implements LM1Service {

    @Autowired
    private LM1Mapper lm1Mapper;
}