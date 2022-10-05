package com.gd.finalproject.scheduler;

import com.gd.finalproject.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Slf4j
@RequiredArgsConstructor
public class SleeperMemberScheduler {
    private final MemberMapper memberMapper;

    // 매일 오전7시
    @Scheduled(cron = "0 0 7 * * *")
    public void sleeperMemberUpdate() throws Exception {
        log.info("휴면 계정 검증 시작");
        LocalDateTime now = LocalDateTime.now();
        // 현재 시간에서 6개월 이후 시간 가져오기
        LocalDateTime date = now.minusMonths(6).minusDays(1);
        // 휴면 계정아이디 휴면처리
        memberMapper.sleepMemberUpdate(date);
        log.info("휴면 계정 업데이트 완료");
    }

    // 매일 오전7시
    //
}
