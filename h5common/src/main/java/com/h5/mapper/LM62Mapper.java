package com.h5.mapper;

import com.h5.entity.LM62;

public interface LM62Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM62 record);

    int insertSelective(LM62 record);

    LM62 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM62 record);

    int updateByPrimaryKey(LM62 record);
}