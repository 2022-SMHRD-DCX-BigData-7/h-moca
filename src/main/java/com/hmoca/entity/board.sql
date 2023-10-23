CREATE TABLE user_info (
   user_id varchar(20) NOT NULL,
   user_pw varchar(20) NOT NULL,
   user_name varchar(20) NOT NULL,
   user_nick varchar(20) NOT NULL,
   user_email varchar(500) NOT NULL
   primary key (user_id)
);

UPDATE TABLE user_info (
   user_id varchar(20) NOT NULL,
   user_pw varchar(20) NOT NULL,
   user_name varchar(20) NOT NULL,
   user_nick varchar(20) NOT NULL,
   user_email varchar(500) NOT NULL,
   user_phone varchar(500) NOT NULL
   primary key (user_id)
);


CREATE TABLE post_info (
    post_idx INT AUTO_INCREMENT PRIMARY KEY,
    post_title VARCHAR(500) NOT NULL,
    post_content VARCHAR(4000) NOT NULL,
    created_at datetime not null default now(),
    post_views INT NOT NULL default 0,
    user_id VARCHAR(20) NOT NULL,
    dist_idx INT NOT NULL
);


CREATE TABLE post_info (
    post_idx INT AUTO_INCREMENT PRIMARY KEY,
    post_title VARCHAR(500) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    dist_idx INT NOT NULL,
    post_content VARCHAR(4000) NOT NULL,
    created_at datetime not null default now(),
    post_views INT NOT NULL default 0
);

ALTER TABLE post_info ADD FOREIGN KEY (dist_idx) REFERENCES dist_info(dist_idx);



CREATE TABLE comment_info (
	cmt_idx INT AUTO_INCREMENT,
	cmt_content VARCHAR(4000) NOT NULL,
	created_at datetime not null default now(),
	user_id VARCHAR(20) NOT NULL,
	post_idx INT NOT NULL,
	primary key(cmt_idx, post_idx),
	foreign key(post_idx) references post_info(post_idx)
);

CREATE TABLE dist_info (
	dist_idx INT AUTO_INCREMENT PRIMARY KEY,
	url_name varchar(4000) NOT NULL,
	video_name varchar(4000) NOT NULL,
	video_thumb varchar(4000) NOT NULL,
	video_score INT NOT NULL,
	user_id varchar(20) NOT NULL
);

CREATE TABLE video_info (
	url_name varchar(4000) PRIMARY KEY,
	video_name varchar(4000) NOT NULL,
	video_thumb varchar(4000) NOT NULL,
	video_views INT NOT NULL,
	cmt_count INT NOT NULL,
	list_count INT NOT NULL,
	dislike_count INT NOT NULL
)

INSERT INTO dist_info (url_name, video_name, video_thumb, video_score, user_id, title_score, thumb_score, meta_score)
VALUES ('1', '1','1', 1, 'sk','1.11','2.22','3.33');

INSERT INTO search_info (user_id,url_name)
VALUES ('user1','https://www.youtube.com/watch?v=RtT8ZYDJQOc');

INSERT INTO search_info (user_id,url_name)
VALUES ('user2','https://www.youtube.com/watch?v=PGYPQzgBA0A');

ALTER TABLE dist_info
DROP COLUMN video_views;

delete from video_info where video_length=614;
delete from post_info where post_idx=78;
delete from user_info where user_id="user05";

select * from user_info;

UPDATE dist_info
SET url_name='https://www.youtube.com/watch?v=3HczHkSTEVY' 
WHERE dist_idx=3;

ALTER TABLE dist_info ADD title_score DECIMAL(10, 2) NOT NULL;
ALTER TABLE dist_info ADD thumb_score DECIMAL(10, 2) NOT NULL;
ALTER TABLE dist_info ADD meta_score DECIMAL(10, 2) NOT NULL;


select * from dist_info;
select * from post_info;
select * from search_info;
select * from video_info;
https://www.youtube.com/watch?v=PGYPQzgBA0A
https://www.youtube.com/watch?v=PGYPQzgBA0A
ALTER TABLE dist_info MODIFY dist_idx int;

delete dist_idx from post_info;
alter table post_info drop column dist_idx;

alter table post_info add column dist_idx;

ALTER TABLE dist_info MODIFY dist_idx INT;

DROP TABLE dist_info;

ALTER TABLE user_info ADD user_email VARCHAR(500);
ALTER TABLE user_info ADD user_phone VARCHAR(500);
DROP TABLE post_info;

ALTER TABLE post_info MODIFY post_idx INT AUTO_INCREMENT PRIMARY KEY;

insert into disf_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트1', '테스트중', '2023-10-04 15:30:00', 0, 'user1', 0);

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트2', '테스트중', '2023-10-06 15:30:00', 0, 'user1', 1);

insert into post_info(post_title, user_id,  dist_idx, post_content) values
('가', 'sk', 0, '가나다라');

insert into post_info(post_title, user_id, post_content, post_views) values
('우즈베키스탄 격투 축구에 박살난 일본! 뒤늦게 보복하는 일본! 하지만 이미 늦었다.', 'user1', '우즈베키스탄 격투 축구에 박살난 일본', 258);

select * from user_info;
select * from dist_info;
select * from comment_info;
select * from post_info;


insert into comment_info(cmt_content, user_id, post_idx)
values ('댓글1','user1','13');
insert into comment_info(cmt_content, user_id, post_idx)
values ('댓글2','user1','13');
insert into comment_info(cmt_content, user_id, post_idx)
values ('댓글3','user1','12');
insert into comment_info(cmt_content, user_id, post_idx)
values ('댓글4','user1','14');
insert into comment_info(cmt_content, user_id, post_idx)
values ('댓글5','user1','14');

select * from user_info;
delete from user_info where user_id='user5';


update post_info set post_content = '<img src="https://www.youtube.com/watch?v=RtT8ZYDJQOc">

이게 가짜뉴스라니.. 판별 해본 후 판별 점수가 낮아서 다시 알아보니 이강인 내용이 아니었어요! 이런 ㅠㅠ'
where post_idx=42

update dist_info set video_name = '툴루즈와 psg 2분 하이라이트'
where dist_idx=9


delete from comment_info where cmt_idx=14 and post_idx=19;

select * from comment_info where post_idx=14;

select video_name, video_thumb, url_name, count(url_name) as url_count 
		from dist_info 
		group by video_name, video_thumb, url_name
		order by url_count desc;
		
		
		select user_id from user_info where user_id = 'user1222'

		
select * from post_info where user_id='user1' order by post_idx desc

select count(*) from user_info where user_id ='user122'
select * from user_info;
commit;

insert into dist_info values (20,'user1','https://www.youtube.com/watch?v=RtT8ZYDJQOc','dd','dd',76,0.2,0.2,0.2,0.2)

select * from search_info;
select * from dist_info;

update dist_info set title_score = 0.57, meta_score = 0.48, thumb_nm_score = 0.37, thumb_img_score = 0.65 where dist_idx=2;

INSERT INTO search_info (user_id, url_name)
values ('user99','https://www.youtube.com/watch?v=8FVRCZTqLzU')

SELECT dist_idx, user_id, url_name
FROM dist_info;

select * from video_info;