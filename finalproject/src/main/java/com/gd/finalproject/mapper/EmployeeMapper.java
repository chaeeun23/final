package com.gd.finalproject.mapper;


import com.gd.finalproject.vo.MemberImg;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface EmployeeMapper {

    int employeeInsert(Map<String, String> map);
}
