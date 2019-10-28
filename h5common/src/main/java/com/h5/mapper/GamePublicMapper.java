package com.h5.mapper;

import com.h5.entity.GamePublic;

public interface GamePublicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GamePublic record);

    int insertSelective(GamePublic record);

    GamePublic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GamePublic record);

    int updateByPrimaryKey(GamePublic record);
}