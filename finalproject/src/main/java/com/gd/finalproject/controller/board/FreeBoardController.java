package com.gd.finalproject.controller.board;

import com.gd.finalproject.service.board.FreeBoardService;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.freeboard.BoardDetailDto;
import com.gd.finalproject.vo.freeboard.BoardDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/free-board")
@Validated
@PreAuthorize("permitAll()")
public class FreeBoardController {
    private final FreeBoardService freeBoardService;

    @GetMapping("/list")
    public String boardList(@RequestParam(required = false, value = "current") String current, Model model) {
        model.addAttribute("pageBoardDto", freeBoardService.boardList(current));
        return "/free_board/board-list";
    }

    @GetMapping("/detail")
    public String boardDetail(@RequestParam("boardNo") int boardNo, Model model) {
        BoardDetailDto boardDto = freeBoardService.boardDetail(boardNo);
        model.addAttribute("boardDetailDto", boardDto);
        return "/free_board/board-detail";
    }


    // 입력폼
    @GetMapping("/insert-form")
    public String insertForm() {
        return "/free_board/insert-form";
    }


    //로직
    @PostMapping("/insert")
    public String addBoard(BoardDto boardDto, @AuthenticationPrincipal MemberDto memberDto,
                           RedirectAttributes redirectAttribute) {
        log.info("boardDto = {}", boardDto);
        boardDto.setMemberId(memberDto.getMemberId());
        freeBoardService.addBoard(boardDto);
        redirectAttribute.addFlashAttribute("suc", "<script>alert('등록성공')</script>");
        return "redirect:/free-board/list";
    }

    @PostMapping("/update")
    public String boardUpdate(BoardDto boardDto, RedirectAttributes redirectAttribute) {
        log.info("여기는 업데이트 boardDto = {}", boardDto);
        boardDto.setBoardNo(boardDto.getBoardNo());
        freeBoardService.updateBoard(boardDto);
        // ?boardNo=13 이런식으로 자동으로 붙여줌
        redirectAttribute.addAttribute("boardNo", boardDto.getBoardNo());
        redirectAttribute.addFlashAttribute("suc", "<script>alert('수정성공')</script>");
        return "redirect:/free-board/detail";
    }


    @GetMapping("/delete")
    public String boardDeleteYn(@RequestParam("boardNo") int boardNo
            , RedirectAttributes redirectAttribute) {
        freeBoardService.boardDeleteYn(boardNo);
        redirectAttribute.addFlashAttribute("suc", "<script>alert('삭제성공')</script>");
        return "redirect:/free-board/list";
    }

}

