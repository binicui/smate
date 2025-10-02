-- 회원 테이블
DROP TABLE IF EXISTS USERS CASCADE;
CREATE TABLE IF NOT EXISTS USERS (
    id                  INT                 NOT NULL AUTO_INCREMENT,
    email               VARCHAR(45)         NOT NULL UNIQUE,
    password            VARCHAR(255)        NOT NULL,
    nickname            VARCHAR(15)         NOT NULL UNIQUE,
    name                VARCHAR(15)         NOT NULL,
    phone               VARCHAR(11)         NOT NULL,
    auth_type           VARCHAR(7)          NOT NULL,
    enabled             TINYINT(1)          NOT NULL,
    deleted_yn          CHAR(1)             NOT NULL DEFAULT 'N',
    created_at          DATETIME            NOT NULL DEFAULT NOW(),
    updated_at          DATETIME            NOT NULL,
    deleted_at          DATETIME            NULL,
    PRIMARY KEY (id)
);


-- 회원 별 권한 테이블
DROP TABLE IF EXISTS USER_ROLES CASCADE;
CREATE TABLE IF NOT EXISTS USER_ROLES (
    user_id             INT                 NOT NULL,
    role                VARCHAR(25)         NOT NULL,
    created_at          DATETIME            NOT NULL DEFAULT NOW(),
    updated_at          DATETIME            NOT NULL,
    PRIMARY KEY (user_id, role),
    CONSTRAINT FK_USER_ROLES_USER_ID FOREIGN KEY (user_id) REFERENCES USERS (id)
);


-- 프로필 정보 테이블
DROP TABLE IF EXISTS PROFILES CASCADE;
CREATE TABLE IF NOT EXISTS PROFILES (
    id                  INT                 NOT NULL AUTO_INCREMENT,
    user_id             INT                 NOT NULL,
    profile_img_url     VARCHAR(255)        NULL,
    bio                 VARCHAR(255)        NULL,
    univ                VARCHAR(50)         NULL,
    location            VARCHAR(50)         NULL,
    site                VARCHAR(255)        NULL,
    created_at          DATETIME            NOT NULL DEFAULT NOW(),
    updated_at          DATETIME            NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_PROFILES_USER_ID FOREIGN KEY (user_id) REFERENCES USERS (id)
);


-- 로그인 이력 테이블
DROP TABLE IF EXISTS LOGIN_HISTORIES CASCADE;
CREATE TABLE IF NOT EXISTS LOGIN_HISTORIES (
    id                  INT                 NOT NULL AUTO_INCREMENT,
    user_id             INT                 NOT NULL,
    ip_address          VARCHAR(15)         NOT NULL,
    device_type         VARCHAR(7)          NOT NULL,
    os                  VARCHAR(20)         NOT NULL,
    browser             VARCHAR(20)         NOT NULL,
    event               CHAR(1)             NOT NULL,
    login_at            DATETIME            NOT NULL,
    logout_at           DATETIME            NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_LOGIN_HISTORIES_USER_ID FOREIGN KEY (user_id) REFERENCES USERS (id)
);


-- 작업 그룹 테이블
DROP TABLE IF EXISTS TASK_GROUPS CASCADE;
CREATE TABLE IF NOT EXISTS TASK_GROUPS (
    id                  INT                 NOT NULL AUTO_INCREMENT,
    name                VARCHAR(50)         NOT NULL,
    sort                INT                 NOT NULL,
    used_yn             CHAR(1)             NOT NULL,
    created_at          DATETIME            NOT NULL DEFAULT NOW(),
    updated_at          DATETIME            NOT NULL,
    PRIMARY KEY (id)
);


--
--DROP TABLE IF EXISTS 테이블명 CASCADE;
--CREATE TABLE IF NOT EXISTS 테이블명 (
--    PRIMARY KEY (PK명)
--);