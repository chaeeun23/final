package com.gd.finalproject.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface AuthMapper {

    int authInsert(@Param("memberId") String memberId);

    int authDelete(@Param("memberId") String memberId);
}
