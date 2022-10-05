package com.gd.finalproject.mapper;

import com.gd.finalproject.vo.freeboard.BoardDto;
import com.gd.finalproject.vo.freeboard.CmDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FreeBoardMapper {
    int getBoardTotal();

    List<BoardDto> getBoardList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);

    void showUp(@Param("boardNo") int boardNo);

    BoardDto boardDetail(@Param("boardNo") int boardNo);


    int addBoard(@Param("boardDto") BoardDto boardDto);

    int updateBoard(@Param("boardDto") BoardDto boardDto);


    int boardDeleteYn(@Param("boardNo") int boardNo);
}
