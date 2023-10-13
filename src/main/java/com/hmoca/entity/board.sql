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

INSERT INTO dist_info (url_name, video_name, video_views, video_thumb, video_score, user_id, title_score, thumb_score, meta_score)
VALUES ('1', '1', 1, '1', 1, 'user1','1.11','2.22','3.33');

ALTER TABLE dist_info
DROP COLUMN video_views;

delete from dist_info where dist_idx=1;
delete from post_info where dist_idx=1;



ALTER TABLE dist_info ADD title_score DECIMAL(10, 2) NOT NULL;
ALTER TABLE dist_info ADD thumb_score DECIMAL(10, 2) NOT NULL;
ALTER TABLE dist_info ADD meta_score DECIMAL(10, 2) NOT NULL;


select * from dist_info;
select * from post_info;
select * from comment_info;

delete dist_idx from post_info;
alter table post_info drop column dist_idx;
ALTER TABLE post_info ADD dist_idx INT;

DROP TABLE dist_info;

ALTER TABLE user_info ADD user_email VARCHAR(500);
ALTER TABLE user_info ADD user_phone VARCHAR(500);
DROP TABLE post_info;

ALTER TABLE post_info MODIFY post_idx INT AUTO_INCREMENT PRIMARY KEY;

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트1', '테스트중', '2023-10-04 15:30:00', 0, 'user1', 0);

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트2', '테스트중', '2023-10-06 15:30:00', 0, 'user1', 1);

insert into post_info(post_title, user_id,  dist_idx, post_content) values
('가', 'sk', 0, '가나다라');

select * from user_info;
select * from post_info;
select * from comment_info;

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

delete from post_info where post_idx=21;

update comment_info set user_id = 'sk', cmt_content = '댓글 수정'
where cmt_idx = 2 and post_idx = 12;


delete from comment_info where cmt_idx=14 and post_idx=19;

select * from comment_info where post_idx=14;

select video_name, video_thumb, url_name, count(url_name) as url_count 
		from dist_info 
		group by video_name, video_thumb, url_name
		order by url_count desc;
		
		
		select user_id from user_info where user_id = 'user1222'

		
select * from post_info where user_id='user1' order by post_idx desc