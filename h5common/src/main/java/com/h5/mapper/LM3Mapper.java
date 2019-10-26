package com.h5.mapper;

import com.h5.entity.LM3;

public interface LM3Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM3 record);

    int insertSelective(LM3 record);

    LM3 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM3 record);

    int updateByPrimaryKey(LM3 record);
}