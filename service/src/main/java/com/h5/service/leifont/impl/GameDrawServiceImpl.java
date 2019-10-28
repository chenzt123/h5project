package com.h5.service.leifont.impl;

import com.h5.mapper.GameDrawMapper;

import com.h5.service.leifont.GameDrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class GameDrawServiceImpl implements GameDrawService {
    @Autowired
    private GameDrawMapper gameDrawMapper;
    @Override
    public Map<String, Object> getIndexNextDate() {
        Map<String,Object> map  = new HashMap<>();
        map = gameDrawMapper.getIndexNextDate();
//        map.put("num",)
        return map;
    }
}
