INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,2, 1, 1, sysdate, sysdate+1, 2, 10000, 'card_type 01', '01', 'card_date 01', sysdate, 'user_name 01', 'user_email 01', '0100');
INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,2, 2, 1, sysdate+1, sysdate+2, 2, 10000, 'card_type 02', '02', 'card_date 02', sysdate, 'user_name 02', 'user_email 02', '0102');
INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,1, 3, 1, sysdate+1, sysdate+3, 3, 50000, 'card_type 03', '03', 'card_date 03', sysdate, 'user_name 03', 'user_email 03', '010231');
INSERT INTO booking (no, user_no, hotel_no, room_no, start_date, end_date, total_person, total_price, card_type, card_no, card_date, reg_date, user_name, user_email, user_phone)
VALUES (booking_SEQ.nextval,1, 4, 1, sysdate, sysdate+2, 4, 70000, 'card_type 04', '04', 'card_date 04', sysdate, 'user_name 04', 'user_email 04', '0102222');

SELECT * FROM review
select * from booking
select * from booking_history
select * from users

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

select h.no as hotelNo, h.city_no as cityNo, count(*), sum(total_price), sum(total_person), h.name
from
(select bh.total_price as total_price, total_person, hotel_no
from booking_history bh
where bh.hotel_no in (select no
					from hotel h
					where h.owner_no=1)
	and trunc(bh.start_date, 'MM') = trunc(sysdate, 'MM')) u, hotel h
where u.hotel_no = h.no
group by h.name, h.no, h.city_no


select b.no as no, b.user_no as userNo, h.no as hotelNo, r.no as roomNo,
		h.name as hotelName, r.name as roomName,
		to_char(start_date, 'yyyy-mm-dd') as startDate, to_char(end_date, 'yyyy-mm-dd') as endDate,
		total_person as totalPerson, total_price as totalPrice,
		card_type as cardType, card_no as cardNo, card_date as cardDate,
		user_name as userName, user_email as userEmail, user_phone as userPhone,
		to_char(b.reg_date, 'yyyy-mm-dd') as regDate
from booking b join hotel h on (b.hotel_no=h.no) join room r on (b.room_no=r.no)
where user_no=1

alter table hotel modify (name varchar2(50))

select * from hotel where no=3

<!-- 통계 테스트 -->
select * from booking where hotel_no in (1,20,21)
select * from booking_history where hotel_no in (1,20,21)
select * from hotel where owner_no=1

select h.no as hotelNo, h.name as hotelName, h.city_no as cityNo,
				count(*) as count, sum(total_price) as profit, sum(total_person) as totalPerson,
				to_char(sysdate,'MM') as month
from hotel h, (select bh.total_price as total_price, total_person, hotel_no
		from booking_history bh) u
where u.hotel_no = h.no
group by h.no, h.name, h.city_no

select 1 from dual where to_char(sysdate,'MM')='07'

ALTER TABLE chart
    ADD CONSTRAINT FK_chart_owner_no_owner_no FOREIGN KEY (owner_no)
        REFERENCES owner (no)
        
select to_char(to_date(7,'mm'),'mm') from dual
select to_date(4,'mm') from dual

select h.no as hotelNo, h.name as hotelName, h.city_no as cityNo,
	count(*) as count, sum(total_price) as profit, sum(total_person) as totalPerson,
	to_char(sysdate,'MM') as month
from hotel h, (select bh.total_price as total_price, total_person, hotel_no
			from booking_history bh
			where bh.hotel_no in (select no
						from hotel h
						where h.owner_no=1)
			and to_char(bh.start_date, 'MM') = to_char(to_date(7,'mm'),'mm')) u
where u.hotel_no = h.no
group by h.name, h.no, h.city_no


select h.no as hotelNo, h.name as hotelName, h.city_no as cityNo,
	count(*) as count, sum(total_price) as profit, sum(total_person) as totalPerson,
	to_char(sysdate,'MM') as month


INSERT INTO chart (hotel_no, year, month, city_no, count, profit, total_person, owner_no) VALUES (1, 2017, 6, 1, 5, 250000, 10, 1);
INSERT INTO chart (hotel_no, year, month, city_no, count, profit, total_person, owner_no) VALUES (1, 2017, 5, 1, 3, 150000, 7, 1);
INSERT INTO chart (hotel_no, year, month, city_no, count, profit, total_person, owner_no) VALUES (1, 2017, 4, 1, 3, 140000, 6, 1);
INSERT INTO chart (hotel_no, year, month, city_no, count, profit, total_person, owner_no) VALUES (1, 2017, 3, 1, 1, 50000, 2, 1);
INSERT INTO chart (hotel_no, year, month, city_no, count, profit, total_person, owner_no) VALUES (2, 2017, 6, 1, 1, 80000, 3, 2);
INSERT INTO chart (hotel_no, year, month, city_no, count, profit, total_person, owner_no) VALUES (2, 2017, 5, 1, 3, 120000, 5, 2);

select h.name as hotelName, c.month, sum(c.count) as count, sum(c.profit) as profit, sum(c.total_person) as totalPerson
from chart c join hotel h on c.hotel_no=h.no
where c.owner_no=1
group by h.name, c.month
order by hotelName, month

select h.no as hotelNo, h.city_no as cityNo, h.name as hotelName,
				c.year, c.month,
				sum(c.count) as count, sum(c.profit) as profit, sum(c.total_person) as totalPerson
		from chart c join hotel h on c.hotel_no=h.no
		where c.owner_no=1 and c.month=6
		group by h.no, h.city_no, h.name, c.year, c.month
order by hotelName, month


		select h.no as hotelNo, h.city_no as cityNo, h.name as hotelName,
				c.year, c.month,
				sum(c.count) as count, sum(c.profit) as profit, sum(c.total_person) as totalPerson
		from chart c join hotel h on c.hotel_no=h.no
		group by h.no, h.city_no, h.name, c.year, c.month
		order by hotelName, month
		
		select * from chart
		
<!-- 호텔별 전체 통계 -->
select h.name as hotelName, count, profit, totalPerson
from (select hotel_no as hotelNo,
			count(*) as count, sum(profit) as profit, sum(total_person) as totalPerson
		from chart group by hotel_no) c join hotel h on (c.hotelNo=h.no)
		
		
select month, count(*) as count, sum(profit) as profit, sum(total_person) as totalPerson
from chart group by month	
		
select h.no as hotelNo, h.name as hotelName, h.city_no as cityNo,
				count(*) as count, sum(total_price) as profit, sum(total_person) as totalPerson,
				to_char(sysdate, 'yyyy') as year, to_char(sysdate,'MM') as month
from hotel h, (select bh.total_price as total_price, total_person, hotel_no
		from booking_history bh
		where bh.hotel_no in (select no
									from hotel h)
						and to_char(bh.start_date, 'MM') = to_char(to_date(6,'MM'),'MM')) u
		where u.hotel_no = h.no
		group by h.no, h.name, h.city_no
		
		
		select h.name as hotelName, count, profit, totalPerson
		from (select hotel_no as hotelNo, count(*) as count,
				 	sum(profit) as profit, sum(total_person) as totalPerson
				from chart where month=6 group by hotel_no) c join hotel h on (c.hotelNo=h.no)
		order by c.month

update booking_history set type='Y' where no=44

select * from booking_history

select * from review

alter table review add (no number)
alter table review add (reg_date date)

create sequence review_seq

select * from booking_history
select * from chart where hotel_no=83

select month, sum(count) as count, sum(profit) as profit, sum(total_person) as totalPerson
	      from chart
	      group by month
	      having month=4
	      
  select * from chart where month=6

select sum(total_price) as profit, sum(total_person) as totalPerson, count(*) as count
from booking_history bh where to_char(bh.start_date, 'MM') = to_char(to_date(6,'mm'),'mm')


	      select h.no as hotelNo, count(*) as roomCount 
from hotel h left outer join booking b on h.no=b.hotel_no
where (total_person>10) and ((trunc(start_date) between to_date('2017-07-26','yyyy-mm-dd') and to_date('2017-07-28','yyyy-mm-dd'))
 or (trunc(end_date) between to_date('2017-07-26','yyyy-mm-dd') and to_date('2017-07-28','yyyy-mm-dd')) )
group by h.no order by 1;

select sum(total_price) as profit, sum(total_person) as totalPerson, count(*) as count
from booking_history bh
where type='Y' and trunc(bh.start_date, 'MM') = trunc(sysdate, 'MM')



