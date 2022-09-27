package com.gd.finalproject.mapper;


import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface AuthMapper {

    int authInsert(Map<String, String> map);
}
