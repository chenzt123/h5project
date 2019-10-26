package com.h5.mapper;

import com.h5.entity.LM52;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface LM52Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM52 record);

    int insertSelective(LM52 record);

    LM52 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM52 record);

    int updateByPrimaryKey(LM52 record);

    List<LM52> queryList();
}