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

CREATE TABLE comment_info (
	cmt_idx INT AUTO_INCREMENT,
	cmt_content VARCHAR(4000) NOT NULL,
	created_at datetime not null default now(),
	user_id VARCHAR(20) NOT NULL,
	post_idx INT NOT NULL,
	primary key(cmt_idx, post_idx),
	foreign key(post_idx) references post_info(post_idx)
);

DROP TABLE comment_info;

ALTER TABLE user_info ADD user_email VARCHAR(500);
ALTER TABLE user_info ADD user_phone VARCHAR(500);
DROP TABLE post_info;

ALTER TABLE post_info MODIFY post_idx INT AUTO_INCREMENT PRIMARY KEY;

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트1', '테스트중', '2023-10-04 15:30:00', 0, 'user1', 0);

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트2', '테스트중', '2023-10-06 15:30:00', 0, 'user1', 0);

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

update comment_info set user_id = 'sk', cmt_content = '댓글 수정'
where cmt_idx = 2 and post_idx = 13;

delete from comment_info where cmt_idx=1 and post_idx=13;

select * from comment_info where post_idx=14;