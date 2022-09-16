package com.gd.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Lecture;

import java.util.List;

@Mapper
public interface BoardMapper {

    List<Lecture> getBoardList(@Param("beginRow") int beginRow,
                             @Param("rowPerPage") int rowPerPage);

    int getBoardTotal();


    int insertBoard(@Param("lecture") Lecture lecture);

    Lecture boardDetail(@Param("lectureNo") int lectureNo);

    int showUp(@Param("lectureNo") int lectureNo);



    int boardDelete(@Param("boardNo") int boardNo);
}
