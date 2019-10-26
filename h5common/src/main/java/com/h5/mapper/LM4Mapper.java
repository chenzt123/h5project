package com.h5.mapper;

import com.h5.entity.LM4;

public interface LM4Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM4 record);

    int insertSelective(LM4 record);

    LM4 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM4 record);

    int updateByPrimaryKey(LM4 record);
}