package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaymentMapper {
	// 결제 중복여부 확인
	int selectPaymentCheck(@Param("userId") String userId, @Param("lectureNo") String lectureNo);
	
	// 고객결제 리스트
	List<Map<String, Object>> selectUserPaymentList(@Param("cartCheck") String cartCheck/* , @Param("lockerUse") String lockerUse */);
	
	// 결제내역 추가(결제목록 장바구니에서 삭제 포함)
	int insertUserPayment(String lectureNo, String userId, String payMethod/*, @Param("lockerUse") String lockerUse*/);

}
