package com.gd.finalproject.mapper;


import com.gd.finalproject.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    String idCheck(@Param("id") String id);

    int signMember(@Param("dto") MemberDto memberDto);

    MemberDto getMember(@Param("id") String memberId);

    int authInsert(@Param("dto") MemberDto memberDto);

    int adminInsert(@Param("dto") MemberDto memberDto);
}
