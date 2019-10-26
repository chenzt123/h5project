package com.h5.mapper;

import com.h5.entity.LM8;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component
public interface LM8Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM8 record);

    int insertSelective(LM8 record);

    LM8 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM8 record);

    int updateByPrimaryKey(LM8 record);

    List<LM8> queryList();
}