package com.gd.finalproject.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.Map;

@Mapper
public interface AuthMapper {

    int authInsert(@Param("memberId") String memberId);

    int authDelete(@Param("memberId") String memberId);

    int inspectDelete(@Param("memberId") String memberId);

    int instructorInsert(@Param("memberId") String memberId);

    int inspectInsert(@Param("memberId") String memberId);

    int instructorDelete(@Param("memberId") String memberId);
}
