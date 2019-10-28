package com.h5.mapper;

import com.h5.entity.PapersList;

public interface PapersListMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PapersList record);

    int insertSelective(PapersList record);

    PapersList selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PapersList record);

    int updateByPrimaryKey(PapersList record);
}