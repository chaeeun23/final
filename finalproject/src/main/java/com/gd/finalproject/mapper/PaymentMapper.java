package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Payment;

@Mapper
public interface PaymentMapper {
	
	// 회원결제내역
	List<Map<String, Object>> selectUserPaymentHistory(String userId, @Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 결제리스트 페이징 Total
	int getUserPaymentTotal(String userId);
		
	// 결제 중복여부 확인
	int selectPaymentCheck(@Param("userId") String userId, @Param("lectureNo") String lectureNo);
	
	// 회원결제 리스트
	List<Map<String, Object>> selectUserPaymentList(@Param("cartCheck") String cartCheck);
	
	// 결제내역 추가(결제목록 장바구니에서 삭제 포함)
	int insertUserPayment(String lectureNo, String userId, Payment payment);

	// 회원결제내역에서 환불상태 변경
	int updateRefundStatement(int courseNo);
	
	// 사물함 선택시 결제내역 수정(사물함 번호 삽입 및 결제금액 수정)
	int updateUserPayment(int courseNo);
}
