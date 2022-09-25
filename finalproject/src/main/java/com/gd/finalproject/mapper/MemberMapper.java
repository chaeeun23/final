package com.gd.finalproject.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.gd.finalproject.vo.MemberDto;

import java.util.List;

@Mapper
public interface MemberMapper {

    String idCheck(@Param("id") String id);

    int signMember(@Param("dto") MemberDto memberDto);

    MemberDto getMember(@Param("id") String memberId);

    int authInsert(@Param("dto") MemberDto memberDto);

    int adminInsert(@Param("dto") MemberDto memberDto);

    MemberDto memberDetail(@Param("memberNo") int memberNo);

    int memberUpdate(@Param("memberDto") MemberDto memberDto);

    List<String> idFind(@Param("email") String email);

    String pwFind(@Param("id") String id, @Param("email") String email);

    void pwChange(@Param("id") String id, @Param("email") String email, @Param("pw") String encode);
}
