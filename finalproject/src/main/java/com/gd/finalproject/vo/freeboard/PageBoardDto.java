package com.gd.finalproject.vo.freeboard;

import com.gd.finalproject.vo.PageNationDto;
import com.gd.finalproject.vo.freeboard.BoardDto;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PageBoardDto {
    private List<BoardDto> boardList;
    private PageNationDto pageNation;
}
