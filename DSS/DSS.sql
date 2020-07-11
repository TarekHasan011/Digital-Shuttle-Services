CREATE TABLE `user` (
  username        char(9) NOT NULL,
  password        varchar(14) NOT NULL,
  current_balance double DEFAULT 0.00 NOT NULL,
  PRIMARY KEY (username));
CREATE TABLE complain (
  complain_id int(12) NOT NULL AUTO_INCREMENT,
  username    char(9) NOT NULL,
  content     varchar(300) NOT NULL,
  date_time   timestamp NOT NULL,
  PRIMARY KEY (complain_id));
CREATE TABLE category (
  complain_id int(12) NOT NULL,
  category    varchar(20) NOT NULL,
  PRIMARY KEY (complain_id,
  category));
CREATE TABLE payment (
  payment_no     int(12) NOT NULL AUTO_INCREMENT,
  username       char(9) NOT NULL,
  transaction_id int(10) NOT NULL UNIQUE,
  date_time      timestamp NOT NULL,
  PRIMARY KEY (payment_no));
CREATE TABLE regular_bus_service (
  username        char(9) NOT NULL,
  registration_no int(12) NOT NULL UNIQUE,
  route           int(1) NOT NULL,
  PRIMARY KEY (username));
CREATE TABLE shuttle_service (
  username  char(9) NOT NULL,
  date_time timestamp NOT NULL,
  PRIMARY KEY (username));
CREATE TABLE attendance_regular_bus (
  username char(9) NOT NULL,
  `date`   date NOT NULL,
  route    int(1) NOT NULL,
  PRIMARY KEY (username,
  `date`));
CREATE TABLE driver (
  employee_id char(7) NOT NULL,
  password    varchar(14) NOT NULL,
  PRIMARY KEY (employee_id));
CREATE TABLE holiday_request (
  request_id  int(12) NOT NULL AUTO_INCREMENT,
  employee_id char(7) NOT NULL,
  content     varchar(300) NOT NULL,
  decision    varchar(20) NOT NULL,
  date_time   timestamp NOT NULL,
  PRIMARY KEY (request_id));
CREATE TABLE notification_driver (
  notification_no int(12) NOT NULL AUTO_INCREMENT,
  employee_id     char(7) NOT NULL,
  content         varchar(50) NOT NULL,
  PRIMARY KEY (notification_no));
CREATE TABLE phone_number_job_request (
  number varchar(15) NOT NULL,
  email  varchar(50) NOT NULL,
  PRIMARY KEY (number));
CREATE TABLE notification_user (
  notification_number int(12) NOT NULL AUTO_INCREMENT,
  username            char(9) NOT NULL,
  content             varchar(50) NOT NULL,
  PRIMARY KEY (notification_number));
CREATE TABLE admin (
  admin_id char(4) NOT NULL,
  password varchar(14) NOT NULL,
  name     varchar(50) NOT NULL,
  email    varchar(50) NOT NULL,
  PRIMARY KEY (admin_id));
CREATE TABLE job_request (
  email             varchar(50) NOT NULL,
  NID               varchar(13) NOT NULL UNIQUE,
  license_number    varchar(20) NOT NULL UNIQUE,
  name              varchar(255) NOT NULL,
  gender            varchar(8) NOT NULL,
  request_date_time timestamp NOT NULL,
  PRIMARY KEY (email));
CREATE TABLE checks_job_request (
  job_request_email varchar(50) NOT NULL,
  admin_id          char(4) NOT NULL,
  date_time         timestamp NOT NULL,
  PRIMARY KEY (job_request_email));
CREATE TABLE user_id_request (
  student_id        char(9) NOT NULL,
  copy_of_id        blob NOT NULL,
  request_date_time timestamp NOT NULL,
  PRIMARY KEY (student_id));
CREATE TABLE checks_user_requst (
  student_id char(9) NOT NULL,
  admin_id   char(4) NOT NULL,
  date_time  timestamp NOT NULL,
  PRIMARY KEY (student_id));
CREATE TABLE permits_user (
  username  char(9) NOT NULL,
  admin_id  char(4) NOT NULL,
  date_time timestamp NOT NULL,
  PRIMARY KEY (username));
CREATE TABLE permits_driver (
  employee_id char(7) NOT NULL,
  admin_id    char(4) NOT NULL,
  date_time   timestamp NOT NULL,
  PRIMARY KEY (employee_id));
CREATE TABLE attendance_driver (
  employee_id char(7) NOT NULL,
  `date`      date NOT NULL,
  PRIMARY KEY (employee_id,
  `date`));
CREATE TABLE blocked_users (
  username  char(9) NOT NULL,
  admin_id  char(4) NOT NULL,
  date_time timestamp NOT NULL,
  PRIMARY KEY (username));
CREATE TABLE registered_student (
  student_id char(9) NOT NULL,
  name       varchar(50) NOT NULL,
  gender     varchar(8) NOT NULL,
  DOB        date NOT NULL,
  photo      varchar(30) NOT NULL,
  email      varchar(50) NOT NULL UNIQUE,
  batch      varchar(3) NOT NULL,
  Department varchar(20) NOT NULL,
  PRIMARY KEY (student_id));
CREATE TABLE phone_number_student (
  phone_number varchar(15) NOT NULL,
  student_id   char(9) NOT NULL,
  PRIMARY KEY (phone_number));
CREATE TABLE registered_driver (
  employee_id    char(7) NOT NULL,
  name           varchar(50) NOT NULL,
  gender         varchar(8) NOT NULL,
  DOB            date NOT NULL,
  photo          varchar(30) NOT NULL,
  email          varchar(50) NOT NULL UNIQUE,
  NID            varchar(13) NOT NULL UNIQUE,
  license_number varchar(20) NOT NULL UNIQUE,
  hire_date      date NOT NULL,
  postal_code    int(6) NOT NULL,
  city           varchar(20) NOT NULL,
  state          varchar(20) NOT NULL,
  PRIMARY KEY (employee_id));
CREATE TABLE id_activation_request (
  employee_id       char(7) NOT NULL,
  copy_of_id        blob NOT NULL,
  request_date_time timestamp NOT NULL,
  PRIMARY KEY (employee_id));
CREATE TABLE check_id_activation_request (
  employee_id char(7) NOT NULL,
  admin_id    char(4) NOT NULL,
  date_time   timestamp NOT NULL,
  PRIMARY KEY (employee_id));
CREATE TABLE phone_number_driver (
  number      varchar(15) NOT NULL,
  employee_id char(7) NOT NULL,
  PRIMARY KEY (number));
ALTER TABLE complain ADD INDEX FKcomplain278087 (username), ADD CONSTRAINT FKcomplain278087 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE payment ADD INDEX FKpayment510245 (username), ADD CONSTRAINT FKpayment510245 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE regular_bus_service ADD INDEX FKregular_bu328366 (username), ADD CONSTRAINT FKregular_bu328366 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE shuttle_service ADD INDEX FKshuttle_se686087 (username), ADD CONSTRAINT FKshuttle_se686087 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE holiday_request ADD INDEX FKholiday_re343381 (employee_id), ADD CONSTRAINT FKholiday_re343381 FOREIGN KEY (employee_id) REFERENCES driver (employee_id);
ALTER TABLE notification_driver ADD INDEX FKnotificati738669 (employee_id), ADD CONSTRAINT FKnotificati738669 FOREIGN KEY (employee_id) REFERENCES driver (employee_id);
ALTER TABLE notification_user ADD INDEX FKnotificati713053 (username), ADD CONSTRAINT FKnotificati713053 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE checks_job_request ADD INDEX FKchecks_job17451 (admin_id), ADD CONSTRAINT FKchecks_job17451 FOREIGN KEY (admin_id) REFERENCES admin (admin_id);
ALTER TABLE checks_job_request ADD INDEX FKchecks_job724333 (job_request_email), ADD CONSTRAINT FKchecks_job724333 FOREIGN KEY (job_request_email) REFERENCES job_request (email);
ALTER TABLE checks_user_requst ADD INDEX FKchecks_use824949 (admin_id), ADD CONSTRAINT FKchecks_use824949 FOREIGN KEY (admin_id) REFERENCES admin (admin_id);
ALTER TABLE permits_user ADD INDEX FKpermits_us15327 (admin_id), ADD CONSTRAINT FKpermits_us15327 FOREIGN KEY (admin_id) REFERENCES admin (admin_id);
ALTER TABLE permits_user ADD INDEX FKpermits_us720920 (username), ADD CONSTRAINT FKpermits_us720920 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE permits_driver ADD INDEX FKpermits_dr860603 (admin_id), ADD CONSTRAINT FKpermits_dr860603 FOREIGN KEY (admin_id) REFERENCES admin (admin_id);
ALTER TABLE permits_driver ADD INDEX FKpermits_dr356237 (employee_id), ADD CONSTRAINT FKpermits_dr356237 FOREIGN KEY (employee_id) REFERENCES driver (employee_id);
ALTER TABLE attendance_driver ADD INDEX FKattendance124993 (employee_id), ADD CONSTRAINT FKattendance124993 FOREIGN KEY (employee_id) REFERENCES driver (employee_id);
ALTER TABLE phone_number_student ADD INDEX FKphone_numb885897 (student_id), ADD CONSTRAINT FKphone_numb885897 FOREIGN KEY (student_id) REFERENCES registered_student (student_id);
ALTER TABLE user_id_request ADD INDEX FKuser_id_re264365 (student_id), ADD CONSTRAINT FKuser_id_re264365 FOREIGN KEY (student_id) REFERENCES registered_student (student_id);
ALTER TABLE checks_user_requst ADD INDEX FKchecks_use232802 (student_id), ADD CONSTRAINT FKchecks_use232802 FOREIGN KEY (student_id) REFERENCES user_id_request (student_id);
ALTER TABLE blocked_users ADD INDEX FKblocked_us130060 (admin_id), ADD CONSTRAINT FKblocked_us130060 FOREIGN KEY (admin_id) REFERENCES admin (admin_id);
ALTER TABLE blocked_users ADD INDEX FKblocked_us105283 (username), ADD CONSTRAINT FKblocked_us105283 FOREIGN KEY (username) REFERENCES `user` (username);
ALTER TABLE phone_number_job_request ADD INDEX FKphone_numb62491 (email), ADD CONSTRAINT FKphone_numb62491 FOREIGN KEY (email) REFERENCES job_request (email);
ALTER TABLE id_activation_request ADD INDEX FKid_activat286134 (employee_id), ADD CONSTRAINT FKid_activat286134 FOREIGN KEY (employee_id) REFERENCES registered_driver (employee_id);
ALTER TABLE check_id_activation_request ADD INDEX FKcheck_id_a255922 (employee_id), ADD CONSTRAINT FKcheck_id_a255922 FOREIGN KEY (employee_id) REFERENCES id_activation_request (employee_id);
ALTER TABLE check_id_activation_request ADD INDEX FKcheck_id_a17349 (admin_id), ADD CONSTRAINT FKcheck_id_a17349 FOREIGN KEY (admin_id) REFERENCES admin (admin_id);
ALTER TABLE phone_number_driver ADD INDEX FKphone_numb733156 (employee_id), ADD CONSTRAINT FKphone_numb733156 FOREIGN KEY (employee_id) REFERENCES registered_driver (employee_id);
ALTER TABLE category ADD INDEX FKcategory99984 (complain_id), ADD CONSTRAINT FKcategory99984 FOREIGN KEY (complain_id) REFERENCES complain (complain_id);
ALTER TABLE attendance_regular_bus ADD INDEX FKattendance374560 (username), ADD CONSTRAINT FKattendance374560 FOREIGN KEY (username) REFERENCES `user` (username);
