package com.h5.mapper;

import com.h5.entity.LM5;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface LM5Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM5 record);

    int insertSelective(LM5 record);

    LM5 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM5 record);

    int updateByPrimaryKey(LM5 record);

    List<LM5> queryList();
}