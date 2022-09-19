package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


  @Mapper 
  public interface InstructorMapper { // instructorList
  List<Map<String,Object>> selectInstructorList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
  
  // instructorList 페이징 Total 
  int getInstructorTotal();
  }
 
