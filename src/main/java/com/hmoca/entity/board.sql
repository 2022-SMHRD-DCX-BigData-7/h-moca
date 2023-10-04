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

select * from user_info;