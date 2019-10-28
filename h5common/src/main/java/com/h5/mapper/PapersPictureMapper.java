package com.h5.mapper;

import com.h5.entity.PapersPicture;

public interface PapersPictureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PapersPicture record);

    int insertSelective(PapersPicture record);

    PapersPicture selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PapersPicture record);

    int updateByPrimaryKey(PapersPicture record);
}