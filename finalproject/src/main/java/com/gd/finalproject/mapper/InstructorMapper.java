package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface InstructorMapper {
    // 강사리스트 instructorList 
    List<Map<String, Object>> selectInstructorList(@Param("beginRow") int beginRow,
                                                   @Param("rowPerPage") int rowPerPage);

    // instructorList 페이징 Total
    int getInstructorTotal();

    // 강사상세보기 instructorOne
    Map<String, Object> selectInstructorOne(@Param("memberId") String memberId);

    int updateInspectYn(@Param("memberId") String memberId);

    int deleteInspectYn(@Param("memberId") String memberId);
}
