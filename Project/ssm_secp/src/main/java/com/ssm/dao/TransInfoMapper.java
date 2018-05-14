package com.ssm.dao;

import com.ssm.pojo.TransInfo;

public interface TransInfoMapper {
    int deleteByPrimaryKey(Long infoid);

    int insert(TransInfo record);

    int insertSelective(TransInfo record);

    TransInfo selectByPrimaryKey(Long infoid);

    int updateByPrimaryKeySelective(TransInfo record);

    int updateByPrimaryKey(TransInfo record);
}