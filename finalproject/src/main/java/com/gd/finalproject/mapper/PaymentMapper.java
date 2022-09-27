package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaymentMapper {
	// 고객결제 리스트
	List<Map<String, Object>> selectUserPaymentList(/* , @Param("lockerUse") String lockerUse */);
	
	// 결제내역 추가
	int insertUserPayment(@Param("userId") String userId, String lectureNo, @Param("cartCheck") String cartCheck, @Param("lockerUse") String lockerUse);

	// 장바구니에서 결제강좌 제거
	int deleteUserPayment(@Param("userId") String userId, int courseNo);
}
