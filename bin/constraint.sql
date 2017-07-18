alter table review drop constraint fk_review_hotel_no_hotel_no;
alter table review drop constraint fk_review_user_no_user_no;
alter table room drop constraint fk_room_hotel_no_hotel_no;
alter table hotel drop constraint fk_hotel_owner_no_owner_no;
alter table image drop constraint fk_image_room_no_room_no;

alter table review add constraint fk_review_hotel_no_hotel_no foreign key(hotel_no) references hotel(no) on delete cascade; 
alter table review add constraint fk_review_user_no_user_no foreign key(user_no) references users(no) on delete set null; 
alter table blind_list add constraint fk_blind_list_user_no_user_no foreign key(user_no) references users(no) on delete set null; 
alter table chart add constraint fk_chart_hotel_no_hotel_no foreign key(hotel_no) references hotel(no) on delete set null; 
alter table room add constraint fk_room_hotel_no_hotel_no foreign key(hotel_no) references hotel(no) on delete cascade; 
alter table hotel add constraint fk_hotel_owner_no_owner_no foreign key(owner_no) references owner(no) on delete cascade; 
alter table image add constraint fk_image_room_no_room_no foreign key(room_no) references room(no) on delete cascade; 



select * from all_constraints
where table_name='room'
select * from hotel
select * from room
select * from image
insert into image (no,room_no,url) values(image_seq.nextval,47,'room47 test1');
insert into image (no,room_no,url) values(image_seq.nextval,47,'room47 test2');
insert into image (no,room_no,url) values(image_seq.nextval,44,'room44 test1');
insert into image (no,room_no,url) values(image_seq.nextval,44,'room44 test2');
select * from room where hotel_no=41