package com.gd.finalproject.controller.board;

import com.gd.finalproject.service.board.CmService;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.freeboard.BoardDetailDto;
import com.gd.finalproject.vo.freeboard.CmDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import static com.gd.finalproject.valid.ValidationGroups.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/cm")
@Validated
public class CmController {
    private final CmService cmService;


    @GetMapping("/list")
    public ResponseEntity<BoardDetailDto> cmList(@RequestParam(required = false, value = "current") String current,
                                                 @RequestParam("boardNo") int boardNo,
                                                 @AuthenticationPrincipal MemberDto memberDto) {
        BoardDetailDto boardDetailDto = cmService.cmList(boardNo, current);
        if (memberDto != null) {
            boardDetailDto.setMemberId(memberDto.getMemberId());
        }
        return ResponseEntity.ok(boardDetailDto);
    }

    @PostMapping("/insert")
    public ResponseEntity<BoardDetailDto> cmInsert(@RequestBody @Validated(cmInsert.class) CmDto cmDto,
                                                   @AuthenticationPrincipal MemberDto memberDto) {
        BoardDetailDto boardDetailDto = cmService.cmInsert(cmDto);
        if (memberDto != null) {
            boardDetailDto.setMemberId(memberDto.getMemberId());
        }
        return ResponseEntity.ok(boardDetailDto);
    }

    @PostMapping("/update")
    public ResponseEntity<BoardDetailDto> cmUpdate(@RequestBody @Validated(cmUpdate.class) CmDto cmDto,
                                                   @AuthenticationPrincipal MemberDto memberDto) {

        BoardDetailDto boardDetailDto = cmService.cmUpdate(cmDto);
        if (memberDto != null) {
            boardDetailDto.setMemberId(memberDto.getMemberId());
        }
        return ResponseEntity.ok(boardDetailDto);
    }

    @PostMapping("/delete")
    public ResponseEntity<BoardDetailDto> cmDelete(@RequestBody @Validated(cmDelete.class) CmDto cmDto,
                                                   @AuthenticationPrincipal MemberDto memberDto) {
        BoardDetailDto boardDetailDto = cmService.cmDelete(cmDto);
        if (memberDto != null) {
            boardDetailDto.setMemberId(memberDto.getMemberId());
        }
        return ResponseEntity.ok(boardDetailDto);
    }

}
