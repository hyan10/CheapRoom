--KS Test SQL

select * from booking;
select *from booking where user_no = (select no from users where email = 'admin')
select * from users
select * from owner
-- city Table Create SQL
CREATE TABLE city
(
    no      NUMBER          NOT NULL, 
    name    VARCHAR2(20)    NOT NULL, 
    CONSTRAINT CITY_PK PRIMARY KEY (no)
)
/

CREATE SEQUENCE city_SEQ
START WITH 1
INCREMENT BY 1;
/

select * from city

insert into city values (city_SEQ.nextval, '서울특별시');
insert into city values (city_SEQ.nextval, '인천광역시');
insert into city values (city_SEQ.nextval, '경기도');
insert into city values (city_SEQ.nextval, '충청북도');
insert into city values (city_SEQ.nextval, '충청남도');
insert into city values (city_SEQ.nextval, '강원도');
insert into city values (city_SEQ.nextval, '전라북도');
insert into city values (city_SEQ.nextval, '전라남도');
insert into city values (city_SEQ.nextval, '경상북도');
insert into city values (city_SEQ.nextval, '경상남도');
insert into city values (city_SEQ.nextval, '대전광역시');
insert into city values (city_SEQ.nextval, '대구광역시');
insert into city values (city_SEQ.nextval, '울산광역시');
insert into city values (city_SEQ.nextval, '부산광역시');
insert into city values (city_SEQ.nextval, '광주광역시');
insert into city values (city_SEQ.nextval, '제주특별자치도');

CREATE OR REPLACE TRIGGER city_no_AI_TRG
BEFORE INSERT ON city 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT city_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON TABLE city IS '지역'
/


-- owner Table Create SQL
CREATE TABLE owner
(
    no          NUMBER          NOT NULL, 
    email       VARCHAR2(50)    NOT NULL, 
    password    VARCHAR2(50)    NOT NULL, 
    name        VARCHAR2(10)    NOT NULL, 
    phone       VARCHAR2(20)    NOT NULL, 
    CRN         VARCHAR2(30)    NOT NULL, 
    reg_date    DATE            NULL, 
    CONSTRAINT OWNER_PK PRIMARY KEY (no)
)

alter table owner modify (phone varchar2(20))
alter table owner modify (crn varchar2(30))
/

CREATE SEQUENCE owner_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER owner_no_AI_TRG
BEFORE INSERT ON owner 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT owner_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON TABLE owner IS '사업자'
/

COMMENT ON COLUMN owner.CRN IS '사업자등록번호'
/


-- hotel Table Create SQL
CREATE TABLE hotel
(
    no             NUMBER           NOT NULL, 
    owner_no       NUMBER     NOT NULL, 
    city_no        NUMBER     NOT NULL, 
    name           VARCHAR2(20)     NOT NULL, 
    blind          CHAR(1)          NOT NULL, 
    tel            VARCHAR2(20)     NOT NULL, 
    parking        CHAR(1)          NOT NULL, 
    wifi           CHAR(1)          NOT NULL, 
    smoking        CHAR(1)          NOT NULL, 
    pool           CHAR(1)          NOT NULL, 
    BBQ            CHAR(1)          NOT NULL, 
    description    VARCHAR2(500)    NOT NULL, 
    checkin        VARCHAR2(20)     NOT NULL, 
    checkout       VARCHAR2(20)     NOT NULL, 
    addr           VARCHAR2(100)    NOT NULL, 
    reg_date       DATE             NULL, 
    CONSTRAINT HOTEL_PK PRIMARY KEY (no)
)

alter table hotel modify (tel varchar2(20))
/

CREATE SEQUENCE hotel_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER hotel_no_AI_TRG
BEFORE INSERT ON hotel 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT hotel_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON TABLE hotel IS '숙박시설'
/

COMMENT ON COLUMN hotel.city_no IS '지역'
/

COMMENT ON COLUMN hotel.blind IS '블라인드 여부 (Y/N)'
/

COMMENT ON COLUMN hotel.parking IS '(Y/N)'
/

COMMENT ON COLUMN hotel.wifi IS '(Y/N)'
/

COMMENT ON COLUMN hotel.smoking IS '(Y/N)'
/

COMMENT ON COLUMN hotel.pool IS '(Y/N)'
/

COMMENT ON COLUMN hotel.BBQ IS '(Y/N)'
/

COMMENT ON COLUMN hotel.addr IS '상세 주소'
/

alter table hotel modify (owner_no number)
alter table hotel modify (city_no number)

ALTER TABLE hotel
    ADD CONSTRAINT FK_hotel_owner_no_owner_no FOREIGN KEY (owner_no)
        REFERENCES owner (no)
/
//////////////////////////////////////////////////////////////////////////
ALTER TABLE hotel
    ADD CONSTRAINT FK_hotel_city_no_city_no FOREIGN KEY (city_no)
        REFERENCES city (no)
/


-- user Table Create SQL
CREATE TABLE users
(
    no          NUMBER          NOT NULL, 
    email       VARCHAR2(50)    NOT NULL, 
    password    VARCHAR2(50)    NOT NULL, 
    type        CHAR(1)         NOT NULL, 
    name        VARCHAR2(10)    NULL, 
    phone       VARCHAR2(20)    NULL, 
    reg_date    DATE            NULL, 
    CONSTRAINT USER_PK PRIMARY KEY (no)
)
/

CREATE SEQUENCE user_SEQ
START WITH 2
INCREMENT BY 1;
/

drop sequence user_SEQ

CREATE OR REPLACE TRIGGER user_no_AI_TRG
BEFORE INSERT ON user 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT user_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON COLUMN user.type IS '일반/관리자 (U/S)'
/

insert into users values (user_SEQ.nextval, 'admin@cheaproom.com', 'admin', 'S','관리자','01099089444',sysdate)
insert into users values (user_SEQ.nextval, 'admin', 'admin', 'S','관리자','01066897746',sysdate)
update users set no=1 where no=2
alter table users modify (phone varchar2(20))
delete from users where no = 1
select * from users



-- room Table Create SQL
CREATE TABLE room
(
    no            NUMBER          NOT NULL, 
    hotel_no      NUMBER          NOT NULL, 
    name          VARCHAR2(50)    NULL, 
    price         NUMBER          NULL, 
    min_person    NUMBER          NULL, 
    max_person    NUMBER          NULL, 
    add_price     NUMBER          NULL, 
    cooking       CHAR(1)         NULL, 
    TV            CHAR(1)         NULL, 
    AC            CHAR(1)         NULL, 
    CONSTRAINT ROOM_PK PRIMARY KEY (no)
)
/

CREATE SEQUENCE room_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER room_no_AI_TRG
BEFORE INSERT ON room 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT room_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON TABLE room IS '방 정보'
/

COMMENT ON COLUMN room.min_person IS '최소 인원'
/

COMMENT ON COLUMN room.max_person IS '최대 인원'
/

COMMENT ON COLUMN room.add_price IS '추가 인원 1인당 요금'
/

COMMENT ON COLUMN room.cooking IS '취사 (Y/N)'
/

COMMENT ON COLUMN room.TV IS '티비 (Y/N)'
/

COMMENT ON COLUMN room.AC IS '에어컨 (Y/N)'
/

ALTER TABLE room
    ADD CONSTRAINT FK_room_hotel_no_hotel_no FOREIGN KEY (hotel_no)
        REFERENCES hotel (no)
/


-- image Table Create SQL
CREATE TABLE image
(
    no         NUMBER           NOT NULL, 
    room_no    NUMBER           NULL, 
    url        VARCHAR2(100)    NULL, 
    CONSTRAINT IMAGE_PK PRIMARY KEY (no)
)
/

CREATE SEQUENCE image_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER image_no_AI_TRG
BEFORE INSERT ON image 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT image_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

ALTER TABLE image
    ADD CONSTRAINT FK_image_room_no_room_no FOREIGN KEY (room_no)
        REFERENCES room (no)
/


-- booking Table Create SQL
CREATE TABLE booking
(
    no              NUMBER          NOT NULL, 
    user_no         NUMBER          NOT NULL, 
    hotel_no        NUMBER          NOT NULL, 
    room_no         NUMBER          NOT NULL, 
    start_date      DATE            NOT NULL, 
    end_date        DATE            NOT NULL, 
    total_person    NUMBER          NOT NULL, 
    total_price     NUMBER          NOT NULL, 
    card_type       VARCHAR2(20)    NOT NULL, 
    card_no         VARCHAR2(20)    NOT NULL, 
    card_date       VARCHAR2(20)    NOT NULL, 
    reg_date        DATE            NOT NULL, 
    user_name       VARCHAR2(20)    NOT NULL, 
    user_email      VARCHAR2(50)    NOT NULL, 
    user_phone      VARCHAR2(20)    NOT NULL, 
    CONSTRAINT BOOKING_PK PRIMARY KEY (no)
)
/


CREATE SEQUENCE booking_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER booking_no_AI_TRG
BEFORE INSERT ON booking 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT booking_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON TABLE booking IS '예약 현황'
/

COMMENT ON COLUMN booking.start_date IS '체크인 날짜'
/

COMMENT ON COLUMN booking.end_date IS '체크아웃 날짜'
/

COMMENT ON COLUMN booking.total_person IS '예약 인원'
/

COMMENT ON COLUMN booking.card_type IS '카드 종류'
/

COMMENT ON COLUMN booking.reg_date IS '예약 날짜'
/

ALTER TABLE booking
    ADD CONSTRAINT FK_booking_user_no_user_no FOREIGN KEY (user_no)
        REFERENCES users (no)
/

ALTER TABLE booking
    ADD CONSTRAINT FK_booking_hotel_no_hotel_no FOREIGN KEY (hotel_no)
        REFERENCES hotel (no)
/

ALTER TABLE booking
    ADD CONSTRAINT FK_booking_room_no_room_no FOREIGN KEY (room_no)
        REFERENCES room (no)
/


-- booking_history Table Create SQL
CREATE TABLE booking_history
(
    no              NUMBER          NOT NULL, 
    user_no         NUMBER          NOT NULL, 
    hotel_no        NUMBER          NOT NULL, 
    room_no         NUMBER          NOT NULL, 
    type            CHAR(1)         NOT NULL, 
    start_date      DATE            NOT NULL, 
    end_date        DATE            NOT NULL, 
    total_person    NUMBER          NOT NULL, 
    total_price     NUMBER          NOT NULL, 
    card_type       VARCHAR2(20)    NOT NULL, 
    card_no         VARCHAR2(20)    NOT NULL, 
    card_date       VARCHAR2(20)    NOT NULL, 
    reg_date        DATE            NOT NULL,
    user_name       VARCHAR2(20)    NOT NULL, 
    user_email      VARCHAR2(50)    NOT NULL, 
    user_phone      VARCHAR2(20)    NOT NULL,
    CONSTRAINT BOOKING_HISTORY_PK PRIMARY KEY (no)
)

alter table booking_history add (user_name VARCHAR2(20) NOT NULL); 
alter table booking_history add(user_email VARCHAR2(50) NOT NULL);
alter table booking_history add (user_phone VARCHAR2(20) NOT NULL);
/

CREATE SEQUENCE booking_history_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER booking_history_no_AI_TRG
BEFORE INSERT ON booking_history 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT booking_history_SEQ.NEXTVAL
    INTO: NEW.no
    FROM DUAL;
END;
/

COMMENT ON COLUMN booking_history.type IS '완료/취소 (Y/N)'
/

COMMENT ON COLUMN booking_history.reg_date IS '처리 날짜'
/


-- review Table Create SQL
CREATE TABLE review
(
    hotel_no       NUMBER    NOT NULL, 
    user_no        NUMBER    NOT NULL, 
    cleanliness    NUMBER    NOT NULL, 
    comfort        NUMBER    NOT NULL, 
    location       NUMBER    NOT NULL, 
    facilities     NUMBER    NOT NULL, 
    staff          NUMBER    NOT NULL
)
/

COMMENT ON TABLE review IS '평점'
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_hotel_no_hotel_no FOREIGN KEY (hotel_no)
        REFERENCES hotel (no)
/

ALTER TABLE review
    ADD CONSTRAINT FK_review_user_no_user_no FOREIGN KEY (user_no)
        REFERENCES users (no)
/


-- blind_list Table Create SQL
CREATE TABLE blind_list
(
    hotel_no    NUMBER           NOT NULL, 
    user_no     NUMBER           NOT NULL, 
    msg         VARCHAR2(100)    NULL, 
    reg_date    DATE             NULL   
)
/

CREATE SEQUENCE blind_list_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER blind_list_hotel_no_AI_TRG
BEFORE INSERT ON blind_list 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT blind_list_SEQ.NEXTVAL
    INTO: NEW.hotel_no
    FROM DUAL;
END;
/

COMMENT ON TABLE blind_list IS '신고내역'
/


-- chart Table Create SQL
CREATE TABLE chart
(
	owner_no		NUMBER	  NOT NULL,
    hotel_no        NUMBER    NOT NULL, 
    year            NUMBER    NOT NULL, 
    month           NUMBER    NOT NULL, 
    city_no         NUMBER    NOT NULL, 
    count           NUMBER    NOT NULL, 
    profit          NUMBER    NOT NULL, 
    total_person    NUMBER    NOT NULL
)
/

alter table chart modify (hotel_no number)

CREATE SEQUENCE chart_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER chart_hotel_no_AI_TRG
BEFORE INSERT ON chart 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT chart_SEQ.NEXTVAL
    INTO: NEW.hotel_no
    FROM DUAL;
END;
/

COMMENT ON TABLE chart IS '호텔 월별 통계'
/

COMMENT ON COLUMN chart.count IS '지난 내역 건수'
/

COMMENT ON COLUMN chart.profit IS '수익'
/

ALTER TABLE chart
    ADD CONSTRAINT FK_chart_city_no_city_no FOREIGN KEY (city_no)
        REFERENCES city (no)
/
ALTER TABLE chart
    ADD CONSTRAINT FK_chart_hotel_no_hotel_no FOREIGN KEY (hotel_no)
        REFERENCES hotel (no)
/

ALTER TABLE chart
    ADD CONSTRAINT FK_chart_owner_no_owner_no FOREIGN KEY (owner_no)
        REFERENCES owner (no)
/