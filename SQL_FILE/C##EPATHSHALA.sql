/*
 Navicat Premium Data Transfer

 Source Server         : epathshala
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Host           : localhost:1521
 Source Schema         : C##EPATHSHALA

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 23/02/2022 02:04:33
*/


-- ----------------------------
-- Table structure for ADMIN
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."ADMIN";
CREATE TABLE "C##EPATHSHALA"."ADMIN" (
  "ADMIN_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "ADMIN_NAME" VARCHAR2(255 BYTE) VISIBLE NOT NULL,
  "PASSWORD" VARCHAR2(8 BYTE) VISIBLE NOT NULL,
  "EMAIL" VARCHAR2(255 BYTE) VISIBLE,
  "PICTURE" VARCHAR2(290 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of ADMIN
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."ADMIN" VALUES ('admin1', 'Ayesha', 'admin', 'ayeshaathoi62@gmail.com', '\images\admin1.jpg');
INSERT INTO "C##EPATHSHALA"."ADMIN" VALUES ('admin2', 'Sumaiya', 'admin', 'sumaiyany@gmail.com', '\images\admin2.jpg');

-- ----------------------------
-- Table structure for COMMENTS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."COMMENTS";
CREATE TABLE "C##EPATHSHALA"."COMMENTS" (
  "COMMENT_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74236".nextval NOT NULL,
  "USER_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "FORUM_ID" NUMBER VISIBLE NOT NULL,
  "COURSE_ID" NUMBER VISIBLE,
  "USER_COMMENT" VARCHAR2(2000 BYTE) VISIBLE,
  "LIKES" NUMBER VISIBLE DEFAULT 0,
  "DISLIKES" NUMBER VISIBLE DEFAULT 0,
  "COMMENT_DATE" DATE VISIBLE DEFAULT sysdate
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of COMMENTS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('64', 'user1', '50', NULL, 'Hi user3', '0', '0', TO_DATE('2022-02-17 19:47:36', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('63', 'user3', '59', '18', 'inserting 3rd comment,edited', '0', '0', TO_DATE('2022-02-17 01:27:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('81', 'user1', '52', '7', 'i am commenting in every forum post(now edited)', '1', '0', TO_DATE('2022-02-21 13:39:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('1', 'user1', '1', NULL, 'how r u', '2', '0', TO_DATE('2022-02-14 18:30:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('2', 'user2', '1', NULL, 'i am fine', '0', '0', TO_DATE('2022-02-14 18:30:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('3', 'user3', '2', NULL, 'I guess this page is complete', '0', '1', TO_DATE('2022-02-14 18:30:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('4', 'user1', '2', NULL, 'just go to the course page and click enroll now.', '3', '1', TO_DATE('2022-02-14 18:30:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('89', 'user13', '53', '8', 'How are you guys-999999999999999', '0', '0', TO_DATE('2022-02-22 16:02:29', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('22', 'user5', '22', '5', 'HOW DO YOU FIND INTEGRATION?', '0', '0', TO_DATE('2022-02-14 18:30:59', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('82', 'user11', '52', '7', 'Hello, I have entered through registration :)', '0', '0', TO_DATE('2022-02-21 16:47:30', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('57', 'user3', '2', NULL, 'inserting 3rd comment', '1', '0', TO_DATE('2022-02-16 21:26:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('58', 'user3', '51', '3', 'sir , this is my first comment here', '0', '1', TO_DATE('2022-02-16 21:30:03', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('59', 'user3', '51', '3', 'i am commenting in every forum post', '1', '0', TO_DATE('2022-02-16 21:30:18', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('60', 'user3', '50', NULL, 'How are you guys', '1', '0', TO_DATE('2022-02-16 21:47:05', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('61', 'user3', '56', '15', 'sir , this is my first comment here', '0', '0', TO_DATE('2022-02-16 21:47:23', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('62', 'user3', '1', NULL, 'save thyself', '0', '0', TO_DATE('2022-02-16 21:48:02', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('83', 'user13', '81', NULL, 'Do you watch ask us anything?', '0', '0', TO_DATE('2022-02-21 17:29:45', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('90', 'user13', '2', NULL, 'How are you guys', '0', '0', TO_DATE('2022-02-22 16:05:53', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('91', 'user1', '51', '3', 'hi', '0', '0', TO_DATE('2022-02-22 21:32:07', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('94', 'user2', '106', '44', 'DISCUSS YOUR PROBLEMS HERE', '0', '0', TO_DATE('2022-02-22 21:39:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('93', 'user2', '105', NULL, 'i guess tcrs can also comment here . i am happy ', '0', '0', TO_DATE('2022-02-22 21:36:16', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('41', 'user2', '51', '3', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:42:51', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('42', 'user4', '52', '7', 'Discuss your problems here', '1', '0', TO_DATE('2022-02-15 04:43:18', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('43', 'user4', '53', '8', 'Discuss your problems here', '1', '0', TO_DATE('2022-02-15 04:43:42', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('44', 'user4', '54', '12', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:44:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('45', 'user6', '55', '13', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:44:29', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('46', 'user6', '56', '15', 'Discuss your problems here', '1', '1', TO_DATE('2022-02-15 04:44:48', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('47', 'user6', '57', '16', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:45:08', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('48', 'user8', '58', '17', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:48:34', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('49', 'user8', '59', '18', 'Discuss your problems here', '2', '1', TO_DATE('2022-02-15 04:49:10', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('50', 'user8', '60', '19', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:49:36', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('51', 'user10', '61', '20', 'Discuss your problems here', '2', '0', TO_DATE('2022-02-15 04:49:58', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "C##EPATHSHALA"."COMMENTS" VALUES ('52', 'user10', '62', '21', 'Discuss your problems here', '0', '0', TO_DATE('2022-02-15 04:50:42', 'SYYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for COURSES
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."COURSES";
CREATE TABLE "C##EPATHSHALA"."COURSES" (
  "COURSE_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74224".nextval NOT NULL,
  "TITLE" VARCHAR2(255 BYTE) VISIBLE NOT NULL,
  "SUBJECT" VARCHAR2(255 BYTE) VISIBLE NOT NULL,
  "PUBLISHED_DATE" DATE VISIBLE DEFAULT SYSDATE,
  "RATING" NUMBER(3,1) VISIBLE,
  "COURSE_DURATION" NUMBER VISIBLE NOT NULL,
  "T_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "COURSE_PIC" VARCHAR2(500 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of COURSES
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('3', 'Complex Analysis', 'Math', TO_DATE('2022-01-17 11:54:36', 'SYYYY-MM-DD HH24:MI:SS'), '5', '3', 'user2', '\images\math.png');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('5', 'Integration', 'Math', TO_DATE('2022-01-18 11:17:55', 'SYYYY-MM-DD HH24:MI:SS'), '4', '2', 'user2', '\images\math.png');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('7', 'Cells', 'Biology', TO_DATE('2022-01-18 11:23:18', 'SYYYY-MM-DD HH24:MI:SS'), '5', '2', 'user4', '\images\biology.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('8', 'Blood Circulation', 'Biology', TO_DATE('2022-01-18 11:24:16', 'SYYYY-MM-DD HH24:MI:SS'), '5', '2', 'user4', '\images\biology.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('12', 'Skeleton', 'Biology', TO_DATE('2022-01-18 11:25:30', 'SYYYY-MM-DD HH24:MI:SS'), '5', '2', 'user4', '\images\biology.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('13', 'Vector', 'Physics', TO_DATE('2022-01-18 11:26:20', 'SYYYY-MM-DD HH24:MI:SS'), '4', '2', 'user6', '\images\physics.png');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('15', 'Light', 'Physics', TO_DATE('2022-01-18 11:26:53', 'SYYYY-MM-DD HH24:MI:SS'), '4', '2', 'user6', '\images\physics.png');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('16', 'Mechanics', 'Physics', TO_DATE('2022-01-18 11:27:50', 'SYYYY-MM-DD HH24:MI:SS'), '4', '2', 'user6', '\images\physics.png');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('17', 'Atoms', 'Chemistry', TO_DATE('2022-01-18 11:28:15', 'SYYYY-MM-DD HH24:MI:SS'), '3', '2', 'user8', '\images\chemistry.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('18', 'Chemical Bonding', 'Chemistry', TO_DATE('2022-01-18 11:28:39', 'SYYYY-MM-DD HH24:MI:SS'), '4', '2', 'user8', '\images\chemistry.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('19', 'Chemical Reaction', 'Chemistry', TO_DATE('2022-01-18 11:29:04', 'SYYYY-MM-DD HH24:MI:SS'), '3', '2', 'user8', '\images\chemistry.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('20', 'Verbs', 'English', TO_DATE('2022-01-18 11:29:29', 'SYYYY-MM-DD HH24:MI:SS'), '5', '2', 'user10', '\images\english.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('21', 'Vocabulary', 'English', TO_DATE('2022-01-18 11:29:53', 'SYYYY-MM-DD HH24:MI:SS'), '5', '2', 'user10', '\images\english.jpg');
INSERT INTO "C##EPATHSHALA"."COURSES" VALUES ('44', 'Family(Sweetest Thing In The World)', 'Social Science', TO_DATE('2022-02-22 21:39:07', 'SYYYY-MM-DD HH24:MI:SS'), '3', '2', 'user2', '\images\cartoon.jpg');

-- ----------------------------
-- Table structure for ENROLLMENT
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."ENROLLMENT";
CREATE TABLE "C##EPATHSHALA"."ENROLLMENT" (
  "ENROLL_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74230".nextval NOT NULL,
  "S_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "COURSE_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of ENROLLMENT
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('104', 'user5', '8');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('105', 'user11', '3');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('106', 'user11', '5');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('107', 'user11', '44');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('61', 'user3', '19');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('3', 'user3', '3');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('4', 'user1', '7');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('5', 'user1', '13');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('6', 'user1', '17');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('7', 'user1', '20');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('8', 'user3', '8');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('9', 'user3', '15');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('10', 'user3', '18');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('11', 'user3', '21');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('12', 'user5', '5');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('13', 'user5', '12');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('14', 'user5', '16');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('15', 'user5', '19');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('103', 'user13', '8');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('18', 'user7', '7');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('19', 'user7', '13');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('20', 'user7', '17');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('21', 'user7', '20');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('22', 'user9', '3');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('23', 'user9', '8');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('24', 'user9', '15');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('25', 'user9', '18');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('26', 'user9', '21');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('81', 'user11', '7');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('42', 'user1', '3');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('43', 'user1', '21');
INSERT INTO "C##EPATHSHALA"."ENROLLMENT" VALUES ('44', 'user3', '20');

-- ----------------------------
-- Table structure for FORUMS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."FORUMS";
CREATE TABLE "C##EPATHSHALA"."FORUMS" (
  "FORUM_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74233".nextval NOT NULL,
  "DISCUSSION_TOPIC" VARCHAR2(1000 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FORUMS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('1', 'HELP');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('2', 'how to enroll in a course');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('22', 'INTEGRATION COURSE DISCUSSION THREAD');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('81', 'ask us');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('50', 'this is my first post');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('104', 'Do you have a cat?');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('105', 'my tcr first post');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('106', 'Family');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('51', 'Complex Analysis');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('52', 'Cells');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('53', 'Blood Circulation');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('54', 'Skeleton');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('55', 'Vector');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('56', 'Light');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('57', 'Mechanics');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('58', 'Atoms');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('59', 'Chemical Bonding');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('60', 'Chemical Reaction');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('61', 'Verbs');
INSERT INTO "C##EPATHSHALA"."FORUMS" VALUES ('62', 'Vocabulary');

-- ----------------------------
-- Table structure for NOTIFICATIONS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."NOTIFICATIONS";
CREATE TABLE "C##EPATHSHALA"."NOTIFICATIONS" (
  "NOTIFICATION_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74227".nextval NOT NULL,
  "NOTIFICATION" VARCHAR2(2000 BYTE) VISIBLE NOT NULL,
  "USER_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of NOTIFICATIONS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('1', 'cmmnt1 by user1', 'user1');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('2', 'cmmnt1 by user2', 'user2');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('3', 'cmmnt1 by user3', 'user3');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('4', 'cmmnt1 by user4', 'user4');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('5', 'cmmnt1 by user5', 'user5');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('6', 'cmmnt1 by user6', 'user6');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('7', 'cmmnt1 by user7', 'user7');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('8', 'cmmnt1 by user8', 'user8');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('9', 'cmmnt1 by user9', 'user9');
INSERT INTO "C##EPATHSHALA"."NOTIFICATIONS" VALUES ('10', 'cmmnt1 by user10', 'user10');

-- ----------------------------
-- Table structure for QUIZES
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."QUIZES";
CREATE TABLE "C##EPATHSHALA"."QUIZES" (
  "QUIZ_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74242".nextval NOT NULL,
  "COURSE_ID" NUMBER VISIBLE NOT NULL,
  "QUIZ_QUES" VARCHAR2(555 BYTE) VISIBLE NOT NULL,
  "OPTION1" VARCHAR2(555 BYTE) VISIBLE NOT NULL,
  "OPTION2" VARCHAR2(555 BYTE) VISIBLE NOT NULL,
  "OPTION3" VARCHAR2(555 BYTE) VISIBLE NOT NULL,
  "OPTION4" VARCHAR2(555 BYTE) VISIBLE NOT NULL,
  "QUES_ANS" VARCHAR2(555 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QUIZES
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('2', '13', 'What is the veclocity of light ?', '3*10^8', '3*10^2', '3.5*10^8', '2*10^8', '3*10^8');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('5', '13', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('6', '3', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('7', '5', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('8', '5', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('9', '7', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('10', '7', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('11', '8', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('12', '8', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('13', '12', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('14', '15', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('15', '15', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('16', '16', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('17', '16', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('18', '17', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('19', '18', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('20', '18', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('21', '19', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('22', '19', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('23', '20', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('24', '20', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('25', '21', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('26', '21', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('29', '3', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('30', '12', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('31', '17', 'some random ques ', 'p', 'q', 'r', 's', 's');
INSERT INTO "C##EPATHSHALA"."QUIZES" VALUES ('46', '44', 'How Many Fingers Are In One Hand?', '1', '2', '5', '3', '5');

-- ----------------------------
-- Table structure for STUDENTS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."STUDENTS";
CREATE TABLE "C##EPATHSHALA"."STUDENTS" (
  "S_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "S_CLASS" NUMBER VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of STUDENTS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user1', '9');
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user3', '10');
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user5', '11');
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user7', '12');
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user9', '8');
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user11', NULL);
INSERT INTO "C##EPATHSHALA"."STUDENTS" VALUES ('user13', '11');

-- ----------------------------
-- Table structure for TAKES_EXAM
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."TAKES_EXAM";
CREATE TABLE "C##EPATHSHALA"."TAKES_EXAM" (
  "EXAM_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74422".nextval NOT NULL,
  "S_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "QUIZ_ID" NUMBER VISIBLE NOT NULL,
  "MARKS" NUMBER VISIBLE DEFAULT -1
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TAKES_EXAM
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('125', 'user5', '11', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('126', 'user5', '12', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('127', 'user11', '6', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('128', 'user11', '29', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('129', 'user11', '7', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('130', 'user11', '8', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('131', 'user11', '46', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('81', 'user3', '21', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('82', 'user3', '22', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('4', 'user1', '9', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('123', 'user13', '11', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('5', 'user1', '10', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('6', 'user1', '2', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('7', 'user1', '5', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('8', 'user1', '18', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('9', 'user1', '31', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('10', 'user1', '23', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('11', 'user1', '24', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('124', 'user13', '12', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('14', 'user7', '9', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('15', 'user7', '10', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('16', 'user7', '2', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('17', 'user7', '5', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('18', 'user7', '18', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('20', 'user7', '31', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('21', 'user7', '23', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('22', 'user7', '24', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('23', 'user5', '7', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('24', 'user5', '8', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('25', 'user5', '13', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('26', 'user5', '30', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('27', 'user5', '16', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('28', 'user5', '17', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('29', 'user5', '21', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('30', 'user5', '22', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('33', 'user3', '6', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('34', 'user3', '29', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('35', 'user3', '11', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('36', 'user3', '12', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('37', 'user3', '14', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('38', 'user3', '15', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('39', 'user3', '19', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('40', 'user3', '20', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('41', 'user3', '25', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('42', 'user3', '26', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('43', 'user9', '25', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('44', 'user9', '26', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('45', 'user9', '19', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('46', 'user9', '20', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('47', 'user9', '14', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('48', 'user9', '15', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('49', 'user9', '11', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('50', 'user9', '12', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('51', 'user9', '29', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('52', 'user9', '6', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('101', 'user11', '9', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('102', 'user11', '10', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('63', 'user1', '6', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('64', 'user1', '29', '1');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('65', 'user1', '25', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('66', 'user1', '26', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('67', 'user3', '23', '0');
INSERT INTO "C##EPATHSHALA"."TAKES_EXAM" VALUES ('68', 'user3', '24', '0');

-- ----------------------------
-- Table structure for TEACHERS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."TEACHERS";
CREATE TABLE "C##EPATHSHALA"."TEACHERS" (
  "T_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "T_DESIGNATION" VARCHAR2(255 BYTE) VISIBLE,
  "T_SPECIALITY" VARCHAR2(255 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TEACHERS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."TEACHERS" VALUES ('user4', 'Lecturer', 'Biology');
INSERT INTO "C##EPATHSHALA"."TEACHERS" VALUES ('user2', 'Lecturer', 'Math');
INSERT INTO "C##EPATHSHALA"."TEACHERS" VALUES ('user6', 'Lecturer', 'Physics');
INSERT INTO "C##EPATHSHALA"."TEACHERS" VALUES ('user8', 'Lecturer', 'Chemistry');
INSERT INTO "C##EPATHSHALA"."TEACHERS" VALUES ('user10', 'Lecturer', 'English');

-- ----------------------------
-- Table structure for TOPICS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."TOPICS";
CREATE TABLE "C##EPATHSHALA"."TOPICS" (
  "TOPIC_ID" NUMBER VISIBLE DEFAULT "C##EPATHSHALA"."ISEQ$$_74239".nextval NOT NULL,
  "TOPIC_NAME" VARCHAR2(255 BYTE) VISIBLE NOT NULL,
  "TOPIC_FILE" VARCHAR2(500 BYTE) VISIBLE,
  "COURSE_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TOPICS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('42', 'Newly Added', 'https://www.youtube.com/embed/NhdtqnEfa9w', '3');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('2', 'Complex analysis', 'https://www.youtube.com/embed/r6C54HHFTwE', '3');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('4', 'complex integration', 'https://www.youtube.com/embed/URUJD5NEXC8', '3');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('5', 'integration formula', 'https://www.youtube.com/embed/novQ9sHuuZQ', '5');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('7', 'integration procedure', 'https://www.youtube.com/embed/lVSF2lP4oBA', '5');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('8', 'what is cell', 'https://www.youtube.com/embed/NhdtqnEfa9w', '7');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('9', 'mytocondria', 'https://www.youtube.com/embed/XRr1kaXKBsU', '7');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('10', 'blood intoduction', 'https://www.youtube.com/embed/l1VXM_b2KFY', '8');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('11', 'blood circulation', 'https://www.youtube.com/embed/snn29wkKTi4', '8');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('12', 'skeleton numbers', 'https://www.youtube.com/embed/lVSF2lP4oBA', '12');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('13', 'ostioporesis', 'https://www.youtube.com/embed/novQ9sHuuZQ', '12');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('14', 'vector triangle formula', 'https://www.youtube.com/embed/XRr1kaXKBsU', '13');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('15', 'vector practical problems', 'https://www.youtube.com/embed/URUJD5NEXC8', '13');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('16', 'light velocity', 'https://www.youtube.com/embed/NhdtqnEfa9w', '15');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('18', 'reflection', 'https://www.youtube.com/embed/XRr1kaXKBsU', '15');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('19', 'newton''s formula', 'https://www.youtube.com/embed/l1VXM_b2KFY', '16');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('20', 'examples', 'https://www.youtube.com/embed/tsUrtyRwfu4', '16');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('21', 'dalton''s theory', 'https://www.youtube.com/embed/URUJD5NEXC8', '17');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('22', 'examples', 'https://www.youtube.com/embed/lVSF2lP4oBA', '17');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('23', 'chemical bonding theory', 'https://www.youtube.com/embed/novQ9sHuuZQ', '18');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('24', 'examples', 'https://www.youtube.com/embed/NhdtqnEfa9w', '18');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('25', 'types of chemical reaction', 'https://www.youtube.com/embed/tsUrtyRwfu4', '19');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('26', 'examples', 'https://www.youtube.com/embed/l1VXM_b2KFY', '19');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('27', 'verbs classifications', 'https://www.youtube.com/embed/tsUrtyRwfu4', '20');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('28', 'examples', 'https://www.youtube.com/embed/lVSF2lP4oBA', '20');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('29', 'vocabulary cheatsheet', 'https://www.youtube.com/embed/novQ9sHuuZQ', '21');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('30', 'more examples', 'https://www.youtube.com/embed/snn29wkKTi4', '21');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('48', 'What Is Family? Isn''t it a blessing? <3', 'https://www.youtube.com/embed/NhdtqnEfa9w', '44');
INSERT INTO "C##EPATHSHALA"."TOPICS" VALUES ('49', 'Definition Of Family', 'https://www.youtube.com/embed/XRr1kaXKBsU', '44');

-- ----------------------------
-- Table structure for USERS
-- ----------------------------
DROP TABLE "C##EPATHSHALA"."USERS";
CREATE TABLE "C##EPATHSHALA"."USERS" (
  "USER_ID" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "PASSWORD" VARCHAR2(8 BYTE) VISIBLE NOT NULL,
  "FULL_NAME" VARCHAR2(255 BYTE) VISIBLE NOT NULL,
  "DATE_OF_BIRTH" DATE VISIBLE,
  "INSTITUTION" VARCHAR2(255 BYTE) VISIBLE,
  "EMAIL" VARCHAR2(255 BYTE) VISIBLE,
  "PICTURE" VARCHAR2(500 BYTE) VISIBLE,
  "ENABLED" CHAR(1 BYTE) VISIBLE NOT NULL,
  "AUTHORITY" VARCHAR2(128 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of USERS
-- ----------------------------
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user1', 'pass1', 'abcd1', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd1@gmail.com', '\images\img_1.jpg', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user2', 'pass2', 'abcd2', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd2@gmail.com', '\images\img_4.jpg', 'Y', 'ROLE_TEACHER');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user3', 'pass3', 'abcd3', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd3@gmail.com', '\images\img_3.jpeg', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user4', 'pass4', 'abcd4', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd4@gmail.com', '\images\img_4.jpg', 'Y', 'ROLE_TEACHER');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user5', 'pass5', 'abcd5', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd5@gmail.com', '\images\img_5.jpg', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user6', 'pass6', 'abcd6', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd6@gmail.com', '\images\img_6.jpg', 'Y', 'ROLE_TEACHER');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user7', 'pass7', 'abcd7', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd7@gmail.com', '\images\img_7.jpg', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user8', 'pass8', 'abcd8', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd8@gmail.com', '\images\img_8.jpg', 'Y', 'ROLE_TEACHER');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user9', 'pass9', 'abcd9', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd9@gmail.com', '\images\img_9.png', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user10', 'pass10', 'abcd10', TO_DATE('2021-12-31 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'abcd10@gmail.com', '\images\img_10.png', 'Y', 'ROLE_TEACHER');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user11', 'pass11', 'Dalshimi', TO_DATE('2022-02-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'BUET', 'sumaiyaany863@gmail.com', '\images\img_7.png', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('user13', 'pass13', 'Yoo Yuri', TO_DATE('2019-02-28 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'SEOUL NATIONAL UNIVERSITY', 'yoori@house.com', '\images\img_19.jpg', 'Y', 'ROLE_STUDENT');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('admin1', 'admin', 'Ayesha', NULL, NULL, 'ayeshaathoi62@gmail.com', '\images\admin1.jpg', 'Y', 'ROLE_ADMIN');
INSERT INTO "C##EPATHSHALA"."USERS" VALUES ('admin2', 'admin', 'Sumaiya', NULL, NULL, 'sumaiyany@gmail.com', '\images\admin2.jpg', 'Y', 'ROLE_ADMIN');

-- ----------------------------
-- Function structure for COUNT_FAILED_EXAM
-- ----------------------------
CREATE OR REPLACE
FUNCTION "C##EPATHSHALA"."COUNT_FAILED_EXAM" AS
BEGIN
		FAILED_EXAM := 0;
		SELECT sum(q_cnt) into FAILED_EXAM 
		FROM	(	SELECT  q.COURSE_ID, count(q.Quiz_id) q_cnt
		FROM TAKES_EXAM t JOIN QUIZES q ON ( t.QUIZ_ID = q.QUIZ_ID ) 
		WHERE t.S_ID = SID AND q.COURSE_ID = QID
		GROUP BY q.COURSE_ID
		HAVING sum(t.marks) * 2 < count(*));
		RETURN FAILED_EXAM;
END;

-- CREATE OR REPLACE FUNCTION COUNT_TOTAL_EXAM(CID IN NUMBER)
-- RETURN NUMBER IS
-- 	TOTAL_EXAM NUMBER;
-- BEGIN
-- 		SELECT count( * ) tot_course_exams INTO TOTAL_EXAM
-- 		FROM COURSES c
-- 		JOIN QUIZES q2 ON ( c.COURSE_ID = q2.COURSE_ID ) WHERE 
-- 		c.COURSE_ID = CID ;
-- 		RETURN TOTAL_EXAM;
-- END;

-- select COURSE_ID,TITLE,SUBJECT,PUBLISHED_DATE,RATING,COURSE_DURATION,T_ID,COURSE_PIC, COUNT_FAILED_EXAM('user3',COURSE_ID) WRONG_ANS , COUNT_TOTAL_EXAM(COURSE_ID) TOT_QUES FROM COURSES ;
/

-- ----------------------------
-- Function structure for COUNT_TOTAL_EXAM
-- ----------------------------
CREATE OR REPLACE
FUNCTION "C##EPATHSHALA"."COUNT_TOTAL_EXAM" AS
BEGIN
		SELECT count( * ) tot_course_exams INTO TOTAL_EXAM
		FROM COURSES c
		JOIN QUIZES q2 ON ( c.COURSE_ID = q2.COURSE_ID ) WHERE 
		c.COURSE_ID = CID ;
		RETURN TOTAL_EXAM;
END;
/

-- ----------------------------
-- Function structure for INSERT_IF_TEACHER_OR_STUDENT
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "C##EPATHSHALA"."INSERT_IF_TEACHER_OR_STUDENT" AS
BEGIN 
	IF(AUTH == 'ROLE_TEACHER') THEN INSERT INTO TEACHERS(T_ID) VALUES(ID);
	ELSIF(AUTH == 'ROLE_STUDENT') THEN INSERT INTO STUDENTS(S_ID) VALUES(ID);
	END IF;
END;
/

-- ----------------------------
-- Sequence structure for ISEQ$$_74224
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74224";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74224" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74227
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74227";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74227" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74230
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74230";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74230" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74233
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74233";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74233" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74236
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74236";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74236" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74239
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74239";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74239" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74242
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74242";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74242" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74245
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74245";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74245" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74419
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74419";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74419" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_74422
-- ----------------------------
DROP SEQUENCE "C##EPATHSHALA"."ISEQ$$_74422";
CREATE SEQUENCE "C##EPATHSHALA"."ISEQ$$_74422" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Primary Key structure for table ADMIN
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."ADMIN" ADD CONSTRAINT "SYS_C007677" PRIMARY KEY ("ADMIN_ID");

-- ----------------------------
-- Checks structure for table ADMIN
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."ADMIN" ADD CONSTRAINT "SYS_C007675" CHECK ("ADMIN_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."ADMIN" ADD CONSTRAINT "SYS_C007676" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table COMMENTS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007702" PRIMARY KEY ("COMMENT_ID");

-- ----------------------------
-- Checks structure for table COMMENTS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007699" CHECK ("COMMENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007700" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007701" CHECK ("FORUM_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table COURSES
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007683" PRIMARY KEY ("COURSE_ID");

-- ----------------------------
-- Checks structure for table COURSES
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007678" CHECK ("COURSE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007679" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007680" CHECK ("SUBJECT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007681" CHECK ("COURSE_DURATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007682" CHECK ("T_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table COURSES
-- ----------------------------
CREATE TRIGGER "C##EPATHSHALA"."COURSE_DELETE" BEFORE DELETE ON "C##EPATHSHALA"."COURSES" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE 
FORUM_IDs NUMBER;
BEGIN
SELECT FORUM_ID INTO FORUM_IDs FROM FORUMS WHERE FORUM_ID IN (SELECT FORUM_ID FROM COMMENTS WHERE COURSE_ID = :OLD.COURSE_ID);
		DELETE FROM COMMENTS WHERE COURSE_ID = :OLD.COURSE_ID;
		DELETE FROM FORUMS WHERE FORUM_ID = FORUM_IDs;
		DELETE FROM TAKES_EXAM WHERE QUIZ_ID IN (SELECT QUIZ_ID FROM QUIZES WHERE COURSE_ID = :OLD.COURSE_ID);
		DELETE FROM QUIZES WHERE COURSE_ID = :OLD.COURSE_ID;
		DELETE FROM ENROLLMENT WHERE COURSE_ID = :OLD.COURSE_ID;
		DELETE FROM TOPICS WHERE COURSE_ID = :OLD.COURSE_ID;
 
END;
/
CREATE TRIGGER "C##EPATHSHALA"."COURSE_INSERTION" AFTER INSERT ON "C##EPATHSHALA"."COURSES" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
	F NUMBER;
BEGIN 
		INSERT INTO FORUMS(DISCUSSION_TOPIC) VALUES(:NEW.TITLE);
		SELECT MAX(FORUM_ID) INTO F FROM FORUMS;
		INSERT INTO COMMENTS (USER_ID,FORUM_ID,COURSE_ID,USER_COMMENT) VALUES(:NEW.T_ID,F,:NEW.COURSE_ID,'DISCUSS YOUR PROBLEMS HERE');
END;
/

-- ----------------------------
-- Primary Key structure for table ENROLLMENT
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."ENROLLMENT" ADD CONSTRAINT "SYS_C007693" PRIMARY KEY ("ENROLL_ID");

-- ----------------------------
-- Checks structure for table ENROLLMENT
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."ENROLLMENT" ADD CONSTRAINT "SYS_C007690" CHECK ("ENROLL_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."ENROLLMENT" ADD CONSTRAINT "SYS_C007691" CHECK ("S_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."ENROLLMENT" ADD CONSTRAINT "SYS_C007692" CHECK ("COURSE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table ENROLLMENT
-- ----------------------------
CREATE TRIGGER "C##EPATHSHALA"."TAKES_EXAM_AFTER_ENROLLMENT" AFTER INSERT ON "C##EPATHSHALA"."ENROLLMENT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE 
BEGIN 
	FOR R IN (SELECT QUIZ_ID FROM QUIZES WHERE COURSE_ID = :NEW.COURSE_ID)
	LOOP
		INSERT INTO TAKES_EXAM (S_ID ,QUIZ_ID ,MARKS) VALUES (:NEW.S_ID,R.QUIZ_ID,0);
	END LOOP;

END;
/

-- ----------------------------
-- Primary Key structure for table FORUMS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."FORUMS" ADD CONSTRAINT "SYS_C007698" PRIMARY KEY ("FORUM_ID");

-- ----------------------------
-- Checks structure for table FORUMS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."FORUMS" ADD CONSTRAINT "SYS_C007696" CHECK ("FORUM_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."FORUMS" ADD CONSTRAINT "SYS_C007697" CHECK ("DISCUSSION_TOPIC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table NOTIFICATIONS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C007688" PRIMARY KEY ("NOTIFICATION_ID");

-- ----------------------------
-- Checks structure for table NOTIFICATIONS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C007685" CHECK ("NOTIFICATION_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C007686" CHECK ("NOTIFICATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C007687" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QUIZES
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007719" PRIMARY KEY ("QUIZ_ID");

-- ----------------------------
-- Checks structure for table QUIZES
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007711" CHECK ("QUIZ_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007712" CHECK ("COURSE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007713" CHECK ("QUIZ_QUES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007714" CHECK ("OPTION1" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007715" CHECK ("OPTION2" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007716" CHECK ("OPTION3" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007717" CHECK ("OPTION4" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007718" CHECK ("QUES_ANS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table STUDENTS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."STUDENTS" ADD CONSTRAINT "SYS_C007673" PRIMARY KEY ("S_ID");

-- ----------------------------
-- Triggers structure for table STUDENTS
-- ----------------------------
CREATE TRIGGER "C##EPATHSHALA"."STUDENTS_DELETE" BEFORE DELETE ON "C##EPATHSHALA"."STUDENTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE 
BEGIN 

		DELETE FROM TAKES_EXAM WHERE S_ID = :OLD.S_ID; 
		DELETE FROM NOTIFICATIONS WHERE USER_ID = :OLD.S_ID;
		DELETE FROM COMMENTS WHERE User_ID = :OLD.S_ID;
		DELETE FROM ENROLLMENT WHERE S_ID = :OLD.S_ID;
		DELETE FROM USERS WHERE USER_ID = :OLD.S_ID;
END;
/

-- ----------------------------
-- Primary Key structure for table TAKES_EXAM
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TAKES_EXAM" ADD CONSTRAINT "SYS_C007738" PRIMARY KEY ("EXAM_ID");

-- ----------------------------
-- Checks structure for table TAKES_EXAM
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TAKES_EXAM" ADD CONSTRAINT "SYS_C007735" CHECK ("EXAM_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."TAKES_EXAM" ADD CONSTRAINT "SYS_C007736" CHECK ("S_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."TAKES_EXAM" ADD CONSTRAINT "SYS_C007737" CHECK ("QUIZ_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TEACHERS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TEACHERS" ADD CONSTRAINT "SYS_C007670" PRIMARY KEY ("T_ID");

-- ----------------------------
-- Triggers structure for table TEACHERS
-- ----------------------------
CREATE TRIGGER "C##EPATHSHALA"."TEACHERS_DELETE" BEFORE DELETE ON "C##EPATHSHALA"."TEACHERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE 
BEGIN 

		DELETE FROM COURSES WHERE T_ID = :OLD.T_ID; 
		DELETE FROM NOTIFICATIONS WHERE USER_ID = :OLD.T_ID;
		DELETE FROM COMMENTS WHERE User_ID = :OLD.T_ID;
		DELETE FROM USERS WHERE USER_ID = :OLD.T_ID;
END;
/

-- ----------------------------
-- Primary Key structure for table TOPICS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TOPICS" ADD CONSTRAINT "SYS_C007709" PRIMARY KEY ("TOPIC_ID");

-- ----------------------------
-- Checks structure for table TOPICS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TOPICS" ADD CONSTRAINT "SYS_C007706" CHECK ("TOPIC_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."TOPICS" ADD CONSTRAINT "SYS_C007707" CHECK ("TOPIC_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."TOPICS" ADD CONSTRAINT "SYS_C007708" CHECK ("COURSE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table TOPICS
-- ----------------------------
CREATE TRIGGER "C##EPATHSHALA"."TOPICS_DELETE" AFTER DELETE ON "C##EPATHSHALA"."TOPICS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW DISABLE 
DECLARE 
BEGIN 
		UPDATE COURSES C SET C.COURSE_DURATION = C.COURSE_DURATION - 1 WHERE C.COURSE_ID = :NEW.COURSE_ID;
END;
/
CREATE TRIGGER "C##EPATHSHALA"."TOPICS_INSERT" AFTER INSERT ON "C##EPATHSHALA"."TOPICS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE 
BEGIN 
		UPDATE COURSES C SET C.COURSE_DURATION = C.COURSE_DURATION + 1 WHERE C.COURSE_ID = :NEW.COURSE_ID;
END;
/

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."USERS" ADD CONSTRAINT "SYS_C007669" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."USERS" ADD CONSTRAINT "SYS_C007667" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."USERS" ADD CONSTRAINT "SYS_C007668" CHECK ("FULL_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."USERS" ADD CONSTRAINT "SYS_C007947" CHECK ( enabled in ('Y','N') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."USERS" ADD CONSTRAINT "SYS_C007948" CHECK ("ENABLED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."USERS" ADD CONSTRAINT "SYS_C007949" CHECK ("AUTHORITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table COMMENTS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007703" FOREIGN KEY ("USER_ID") REFERENCES "C##EPATHSHALA"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007704" FOREIGN KEY ("FORUM_ID") REFERENCES "C##EPATHSHALA"."FORUMS" ("FORUM_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."COMMENTS" ADD CONSTRAINT "SYS_C007705" FOREIGN KEY ("COURSE_ID") REFERENCES "C##EPATHSHALA"."COURSES" ("COURSE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table COURSES
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."COURSES" ADD CONSTRAINT "SYS_C007684" FOREIGN KEY ("T_ID") REFERENCES "C##EPATHSHALA"."TEACHERS" ("T_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table ENROLLMENT
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."ENROLLMENT" ADD CONSTRAINT "SYS_C007694" FOREIGN KEY ("S_ID") REFERENCES "C##EPATHSHALA"."STUDENTS" ("S_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."ENROLLMENT" ADD CONSTRAINT "SYS_C007695" FOREIGN KEY ("COURSE_ID") REFERENCES "C##EPATHSHALA"."COURSES" ("COURSE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table NOTIFICATIONS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."NOTIFICATIONS" ADD CONSTRAINT "SYS_C007689" FOREIGN KEY ("USER_ID") REFERENCES "C##EPATHSHALA"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table QUIZES
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."QUIZES" ADD CONSTRAINT "SYS_C007720" FOREIGN KEY ("COURSE_ID") REFERENCES "C##EPATHSHALA"."COURSES" ("COURSE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table STUDENTS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."STUDENTS" ADD CONSTRAINT "SYS_C007674" FOREIGN KEY ("S_ID") REFERENCES "C##EPATHSHALA"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TAKES_EXAM
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TAKES_EXAM" ADD CONSTRAINT "SYS_C007739" FOREIGN KEY ("QUIZ_ID") REFERENCES "C##EPATHSHALA"."QUIZES" ("QUIZ_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##EPATHSHALA"."TAKES_EXAM" ADD CONSTRAINT "SYS_C007740" FOREIGN KEY ("S_ID") REFERENCES "C##EPATHSHALA"."STUDENTS" ("S_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TEACHERS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TEACHERS" ADD CONSTRAINT "SYS_C007671" FOREIGN KEY ("T_ID") REFERENCES "C##EPATHSHALA"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table TOPICS
-- ----------------------------
ALTER TABLE "C##EPATHSHALA"."TOPICS" ADD CONSTRAINT "SYS_C007710" FOREIGN KEY ("COURSE_ID") REFERENCES "C##EPATHSHALA"."COURSES" ("COURSE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
