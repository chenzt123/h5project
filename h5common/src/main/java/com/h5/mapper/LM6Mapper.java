package com.h5.mapper;

import com.h5.entity.LM6;

public interface LM6Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM6 record);

    int insertSelective(LM6 record);

    LM6 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM6 record);

    int updateByPrimaryKey(LM6 record);
}