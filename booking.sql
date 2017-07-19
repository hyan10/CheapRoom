INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,2, 1, 1, sysdate, sysdate+1, 2, 10000, 'card_type 01', '01', 'card_date 01', sysdate, 'user_name 01', 'user_email 01', '0100');
INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,2, 2, 1, sysdate+1, sysdate+2, 2, 10000, 'card_type 02', '02', 'card_date 02', sysdate, 'user_name 02', 'user_email 02', '0102');
INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,1, 3, 1, sysdate+1, sysdate+3, 3, 50000, 'card_type 03', '03', 'card_date 03', sysdate, 'user_name 03', 'user_email 03', '010231');
INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,1, 4, 1, sysdate, sysdate+2, 4, 70000, 'card_type 04', '04', 'card_date 04', sysdate, 'user_name 04', 'user_email 04', '0102222');

select * from booking
select * from booking_history

<!-- 유저의 예약 리스트 - 호텔이름,방이름 --!>
select h.name, r.name, total_person, user_name
from booking b join hotel h on (b.hotel_no=h.no) join room r on (h.no=r.hotel_no)
where user_no=1


update room set name='rName3_1' where no=3 
update room set name='rName4_1' where no=4


<!-- 사업자의 예약 현황 -->
select h.name, r.name
from booking b join hotel h on (b.hotel_no=h.no) join room r on (h.no=r.hotel_no)
where h.owner_no=3

insert into booking values (booking_seq.nextval, 1, 1, 1, '2017-07-20', '2017-07-22', 3, 100000,
								'BC', 12345678, '10/20', sysdate, '첫테스트', 'abc@abc.com', '010-1234-5678')
								

update booking set user_name = 'test' where no=5


<!-- 월별 통계 -->


select *
from hotel h, booking b --, booking_history bh
where h.owner_no=1 and h.no=b.hotel_no

select *
from booking b
where hotel_no=1

select *
from booking_history bh
where hotel_no=1

select trunc(sysdate, 'MM') from dual)

select count(*), sum(total_price), sum(total_person), h.name
from
((select b.total_price as total_price, total_person, hotel_no
from booking b
where b.hotel_no in (select no
					from hotel h
					where h.owner_no=1)
	and trunc(b.start_date, 'MM') = trunc(sysdate, 'MM'))
union
(select bh.total_price as total_price, total_person, hotel_no
from booking_history bh
where bh.hotel_no in (select no
					from hotel h
					where h.owner_no=1)
	and trunc(bh.start_date, 'MM') = trunc(sysdate, 'MM'))) u, hotel h
where u.hotel_no = h.no
group by h.name


select b.no as no, b.type as type, b.user_no as userNo, h.no as hotelNo, r.no as roomNo,
		h.name as hotelName, r.name as roomName,
		to_char(start_date, 'yyyy-mm-dd') as startDate, to_char(end_date, 'yyyy-mm-dd') as endDate,
		total_person as totalPerson, total_price as totalPrice,
		card_type as cardType, card_no as cardNo, card_date as cardDate,
		user_name as userName, user_email as userEmail, user_phone as userPhone,
		to_char(b.reg_date, 'yyyy-mm-dd') as regDate
from booking_history b join hotel h on (b.hotel_no=h.no) join room r on (h.no=r.hotel_no)
where user_no=1