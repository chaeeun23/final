package com.gd.finalproject.service.board;


import com.gd.finalproject.mapper.CmMapper;
import com.gd.finalproject.mapper.FreeBoardMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.PageNationDto;
import com.gd.finalproject.vo.freeboard.BoardDetailDto;
import com.gd.finalproject.vo.freeboard.BoardDto;
import com.gd.finalproject.vo.freeboard.CmDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CmService {

    private final CmMapper cmMapper;

    @Transactional
    public BoardDetailDto cmList(int boardNo, String current) {
        // int bno = Integer.parseInt(boardNo);
        PageNationDto pageNation = PageNationUtil.getPageNation(current, cmMapper.getCmTotal(boardNo), "/free-board/list", 5);
        List<CmDto> cmList = cmMapper.getCmList(boardNo, pageNation.getBeginRow(), pageNation.getRowPerPage());
        return BoardDetailDto.builder()
                .pageNation(pageNation)
                .boardNo(boardNo)
                .cmList(cmList)
                .build();
    }

    public BoardDetailDto cmInsert(CmDto cmDto) {
        cmMapper.cmInsert(cmDto);
        return cmList(cmDto.getBoardNo(), "1");
    }

    public BoardDetailDto cmUpdate(CmDto cmDto) {
        cmMapper.cmUpdate(cmDto);
        return cmList(cmDto.getBoardNo(), cmDto.getCurrent());
    }

    public BoardDetailDto cmDelete(CmDto cmDto) {
        cmMapper.cmDelete(cmDto);
        BoardDetailDto boardDetailDto = cmList(cmDto.getBoardNo(), cmDto.getCurrent());
        if (boardDetailDto.getCmList() == null || boardDetailDto.getCmList().size() == 0) {
            String current = cmDto.getCurrent();
            int num = Integer.parseInt(current);
            num--;
            num = num > 0 ? num : 1;
            boardDetailDto = cmList(cmDto.getBoardNo(), String.valueOf(num));
        }
        return boardDetailDto;
    }
}
