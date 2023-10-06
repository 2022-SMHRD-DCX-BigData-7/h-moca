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
    created_at DATE NOT NULL,
    post_views INT NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    dist_idx INT NOT NULL
);

CREATE TABLE comment_info (
	cmt_idx INT AUTO_INCREMENT PRIMARY KEY,
	cmt_content VARCHAR(4000) NOT NULL,
	created_at DATE NOT NULL,
	user_id VARCHAR(20) NOT NULL,
	post_idx INT NOT NULL
)

ALTER TABLE user_info ADD user_email VARCHAR(500);
ALTER TABLE user_info ADD user_phone VARCHAR(500);
DROP TABLE post_info;

ALTER TABLE post_info MODIFY post_idx INT AUTO_INCREMENT PRIMARY KEY;

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트1', '테스트중', '2023-10-04 15:30:00', 0, 'user1', 0);

insert into post_info(post_title, post_content, created_at, post_views, user_id, dist_idx) values
('게시글테스트2', '테스트중', '2023-10-06 15:30:00', 0, 'user1', 0);

select * from user_info;
select * from post_info;
select * from comment_info;

