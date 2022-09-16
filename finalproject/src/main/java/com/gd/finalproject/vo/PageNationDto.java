package com.gd.finalproject.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageNationDto {
    private int rowPerPage;
    private int currentPage;
    private int total;
    private int pageCount;
    private int lastPage;
    private int startPage;
    private int endPage;
    private int beginRow;
    private String path;
}
