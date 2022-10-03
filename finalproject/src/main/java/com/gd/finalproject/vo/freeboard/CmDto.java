package com.gd.finalproject.vo.freeboard;

import com.gd.finalproject.valid.ValidationGroups;
import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

import static com.gd.finalproject.valid.ValidationGroups.*;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CmDto {

    @NotNull(groups = {cmUpdate.class, cmDelete.class})
    private int cmNo;
    @NotNull(groups = {cmInsert.class, cmUpdate.class})
    private int boardNo;
    @NotBlank(groups = cmInsert.class)
    private String memberId;
    @NotBlank(groups = {cmInsert.class, cmUpdate.class})
    @Length(min = 1, groups = {cmInsert.class, cmUpdate.class})
    private String cmContents;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private List<String> memberAuth;
    private String current;
}
