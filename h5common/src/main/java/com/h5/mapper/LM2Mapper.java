package com.h5.mapper;

import com.h5.entity.LM2;

public interface LM2Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM2 record);

    int insertSelective(LM2 record);

    LM2 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM2 record);

    int updateByPrimaryKey(LM2 record);
}