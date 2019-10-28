package com.h5.mapper;

import com.h5.entity.GameDrawOp;
import com.h5.entity.GameDrawOpKey;

public interface GameDrawOpMapper {
    int deleteByPrimaryKey(GameDrawOpKey key);

    int insert(GameDrawOp record);

    int insertSelective(GameDrawOp record);

    GameDrawOp selectByPrimaryKey(GameDrawOpKey key);

    int updateByPrimaryKeySelective(GameDrawOp record);

    int updateByPrimaryKey(GameDrawOp record);
}