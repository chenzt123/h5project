package com.h5.mapper;

import com.h5.entity.LM1;

public interface LM1Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM1 record);

    int insertSelective(LM1 record);

    LM1 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM1 record);

    int updateByPrimaryKey(LM1 record);
}