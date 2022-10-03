package com.gd.finalproject.vo.freeboard;

import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.PageNationDto;
import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDetailDto {
    private BoardDto boardDto;
    private PageNationDto pageNation;
    private List<CmDto> cmList;
    private String memberId;
    private int boardNo;
}
