package com.h5.mapper;

import com.h5.entity.LM7;
import com.h5.entity.LM8;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component
public interface LM7Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM7 record);

    int insertSelective(LM7 record);

    LM7 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM7 record);

    int updateByPrimaryKey(LM7 record);

    List<LM7> queryList();
}