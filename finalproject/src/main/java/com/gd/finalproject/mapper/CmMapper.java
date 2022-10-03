package com.gd.finalproject.mapper;

import com.gd.finalproject.vo.freeboard.CmDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CmMapper {

    List<CmDto> getCmList(@Param("boardNo") int boardNo, @Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);

    int getCmTotal(@Param("boardNo") int boardNo);

    int cmInsert(@Param("cmDto") CmDto cmDto);

    int cmUpdate(@Param("cmDto") CmDto cmDto);

    int cmDelete(@Param("cmDto") CmDto cmDto);
}
