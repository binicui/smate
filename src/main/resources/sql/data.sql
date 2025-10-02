-- 작업 그룹 테이블 데이터 삽입
INSERT INTO TASK_GROUPS (
    name, sort, used_yn, updated_at
) VALUES (
    '기획 및 요구사항 분석', 1, 'Y', NOW()
);

INSERT INTO TASK_GROUPS (
    name, sort, used_yn, updated_at
) VALUES (
    '시스템 설계', 2, 'Y', NOW()
);

INSERT INTO TASK_GROUPS (
    name, sort, used_yn, updated_at
) VALUES (
    '구현', 3, 'Y', NOW()
);

INSERT INTO TASK_GROUPS (
    name, sort, used_yn, updated_at
) VALUES (
    '테스트', 4, 'Y', NOW()
);

INSERT INTO TASK_GROUPS (
    name, sort, used_yn, updated_at
) VALUES (
    '유지보수', 5, 'Y', NOW()
);