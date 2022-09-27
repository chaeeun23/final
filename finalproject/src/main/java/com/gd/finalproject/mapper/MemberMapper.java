package com.gd.finalproject.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.gd.finalproject.vo.MemberDto;

import java.util.List;

@Mapper
public interface MemberMapper {

    //아이디찾기
    String idCheck(@Param("id") String id);

    //회원가입
    int signMember(@Param("dto") MemberDto memberDto);


    MemberDto getMember(@Param("id") String memberId);

    //user 권한넣기
    int authInsert(@Param("dto") MemberDto memberDto);



    //회원 마이페이지
    MemberDto memberDetail(@Param("memberNo") int memberNo);

    //마이페이지수정
    int memberUpdate(@Param("memberDto") MemberDto memberDto);

    //아이디찾기
    List<String> idFind(@Param("email") String email);

    //비밀번호찾기
    String pwFind(@Param("id") String id, @Param("email") String email);

    //임시비밀번호
    void pwChange(@Param("id") String id, @Param("email") String email, @Param("pw") String encode);


    //전체회원토탈
    int getMemberTotal();

    //전체회원조회
    List<MemberDto> getMemberList(@Param("beginRow") int beginRow,
                                  @Param("rowPerPage") int rowPerPage);

    //user 테이블에 넣기
    int userInsert(@Param("dto") MemberDto memberDto);
}
