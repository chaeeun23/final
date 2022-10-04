package com.gd.finalproject.vo.freeboard;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
    private int boardNo;
    private String memberId;
    private String boardTitle;
    private String boardContents;
    private int boardRead;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
}
