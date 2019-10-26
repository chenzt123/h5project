package com.h5.mapper;

import com.h5.entity.LM6;
import com.h5.entity.LM62;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface LM62Mapper {
    int deleteByPrimaryKey(Long id);

    int insert(LM62 record);

    int insertSelective(LM62 record);

    LM62 selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(LM62 record);

    int updateByPrimaryKey(LM62 record);

    List<LM62> queryList();
}