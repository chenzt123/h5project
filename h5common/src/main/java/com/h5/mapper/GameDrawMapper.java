package com.h5.mapper;

import com.h5.entity.GameDraw;
import com.h5.entity.GameDrawKey;

public interface GameDrawMapper {
    int deleteByPrimaryKey(GameDrawKey key);

    int insert(GameDraw record);

    int insertSelective(GameDraw record);

    GameDraw selectByPrimaryKey(GameDrawKey key);

    int updateByPrimaryKeySelective(GameDraw record);

    int updateByPrimaryKey(GameDraw record);
}