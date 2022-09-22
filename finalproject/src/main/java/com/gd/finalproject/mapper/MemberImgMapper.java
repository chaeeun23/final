package com.gd.finalproject.mapper;


import com.gd.finalproject.vo.MemberImg;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberImgMapper {
    int updateMemberImg(@Param("memberImg") MemberImg memberImg);



}
