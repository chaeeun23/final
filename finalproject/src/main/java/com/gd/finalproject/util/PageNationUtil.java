package com.gd.finalproject.util;

import com.gd.finalproject.dto.PageNationDto;

public class PageNationUtil {
    /**
     *
     * @Param current
     * @Param total
     * @Param path
     * @Param rowPerPage
     *
     * @return PageNationDto
     * @apiNote 페이지네이션 메서드
     * */
    public static PageNationDto getPageNation(String current, int total, String path, int rowPerPage) {
        int currentPage = 1;
        if (current != null) {
            currentPage = Integer.parseInt(current);
        }
        if (currentPage < 0) {
            currentPage = 1;
        }
        int beginRow = (currentPage - 1) * rowPerPage;
        
        // 페이지네이션 세팅
        int lastPage = total / rowPerPage;
        if (total % rowPerPage != 0) {
            lastPage += 1;
        }
        // 몇개 페이지 나타낼껀지
        int pageCount = 10;
        
        // 공식
        int startPage = ((currentPage - 1) / pageCount) * pageCount + 1;
        int endPage = (((currentPage - 1) / pageCount) + 1) * pageCount;
        if (lastPage < endPage) {
            endPage = lastPage;
        }
        
        PageNationDto pageNationDto = new PageNationDto();
        pageNationDto.setCurrentPage(currentPage);
        pageNationDto.setLastPage(lastPage);
        pageNationDto.setStartPage(startPage);
        pageNationDto.setTotal(total);
        pageNationDto.setPageCount(pageCount);
        pageNationDto.setRowPerPage(rowPerPage);
        pageNationDto.setEndPage(endPage);
        pageNationDto.setPath(path);
        pageNationDto.setBeginRow(beginRow);
        
        return pageNationDto;
    }
}
