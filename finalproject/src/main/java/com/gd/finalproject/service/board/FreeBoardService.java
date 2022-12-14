package com.gd.finalproject.service.board;

import com.gd.finalproject.mapper.CmMapper;
import com.gd.finalproject.mapper.FreeBoardMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.freeboard.BoardDetailDto;
import com.gd.finalproject.vo.freeboard.BoardDto;
import com.gd.finalproject.vo.freeboard.CmDto;
import com.gd.finalproject.vo.freeboard.PageBoardDto;
import com.gd.finalproject.vo.PageNationDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FreeBoardService {

    private final FreeBoardMapper freeBoardMapper;
    private final CmMapper cmMapper;
    private final ServletContext servletContext;

    public PageBoardDto boardList(@RequestParam(required = false) String current) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        String contextPath = attr.getRequest().getContextPath();
        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, freeBoardMapper.getBoardTotal(), contextPath + "/free-board/list", 10);
        // 보드리스트 가져오기
        List<BoardDto> boardList = freeBoardMapper.getBoardList(pageNation.getBeginRow(), pageNation.getRowPerPage());

        return PageBoardDto.builder()
                .boardList(boardList)
                .pageNation(pageNation)
                .build();
    }

    @Transactional
    public BoardDetailDto boardDetail(int boardNo) {
        // 조회수오르고
        freeBoardMapper.showUp(boardNo);
        // 보드상세 갖다주고
        BoardDto boardDto = freeBoardMapper.boardDetail(boardNo);
        PageNationDto pageNation = PageNationUtil.getPageNation("1", cmMapper.getCmTotal(boardNo), "/free-board/list", 5);
        List<CmDto> cmList = cmMapper.getCmList(boardDto.getBoardNo(), pageNation.getBeginRow(), pageNation.getRowPerPage());
        return BoardDetailDto.builder()
                .boardDto(boardDto)
                .pageNation(pageNation)
                .cmList(cmList)
                .build();
    }

    public int addBoard(BoardDto boardDto) {
        return freeBoardMapper.addBoard(boardDto);
    }

    public int updateBoard(BoardDto boardDto) {
        return freeBoardMapper.updateBoard(boardDto);
    }


    public int boardDeleteYn(int boardNo) {
        return freeBoardMapper.boardDeleteYn(boardNo);
    }
}
