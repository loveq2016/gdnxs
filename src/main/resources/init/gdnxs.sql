/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017-04-03 11:06:49                          */
/*==============================================================*/


drop table if exists TB_ACTIVITY_INFO;

drop table if exists TB_ACTIVITY_PICS;

drop table if exists TB_ACT_MEMBER_REF;

drop table if exists TB_FAQ_INFO;

drop table if exists TB_MEMBERVOTEREC;

drop table if exists TB_MEMBER_INFO;

drop table if exists TB_MSG_INFO;

drop table if exists TB_NOTICE_INFO;

/*==============================================================*/
/* Table: TB_ACTIVITY_INFO                                      */
/*==============================================================*/
create table TB_ACTIVITY_INFO
(
   ID                   varchar(36) not null,
   TITLE                varchar(100),
   HOMEPAGEP            varchar(100),
   END_TIME             datetime,
   IS_PUSH_HOMEPAGE     varchar(2),
   ACTIVIY_DESC         text,
   ASTATUS              varchar(2),
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   MODIFIEDID           varchar(36),
   MODIFIEDDATE         datetime,
   DELETEDFLAG          int,
   primary key (ID)
);

/*==============================================================*/
/* Table: TB_ACTIVITY_PICS                                      */
/*==============================================================*/
create table TB_ACTIVITY_PICS
(
   ID                   varchar(36) not null,
   ACT_ID               varchar(36),
   PSESC                varchar(100),
   PURL                 varchar(100),
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   MODIFIEDID           varchar(36),
   MODIFIEDDATE         datetime,
   DELETEDFLAG          int,
   primary key (ID)
);

/*==============================================================*/
/* Table: TB_ACT_MEMBER_REF                                     */
/*==============================================================*/
create table TB_ACT_MEMBER_REF
(
   ID                   varchar(36) not null,
   ACT_ID               varchar(36),
   MEMBER_ID            varchar(36),
   NO                   int,
   VOTENUM              int,
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   primary key (ID)
);

/*==============================================================*/
/* Table: TB_FAQ_INFO                                           */
/*==============================================================*/
create table TB_FAQ_INFO
(
   ID                   varchar(36) not null,
   TITLE                varchar(100),
   FAQ_DESC             text,
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   MODIFIEDID           varchar(36),
   MODIFIEDDATE         datetime,
   DELETEDFLAG          int,
   primary key (ID)
);

/*==============================================================*/
/* Table: TB_MEMBERVOTEREC                                      */
/*==============================================================*/
create table TB_MEMBERVOTEREC
(
   ID                   varchar(36),
   OPENID               varchar(200),
   NAME                 varchar(100),
   ACT_ID               varchar(36),
   MENBER               varchar(36),
   IP                   varchar(100)
);

/*==============================================================*/
/* Table: TB_MEMBER_INFO                                        */
/*==============================================================*/
create table TB_MEMBER_INFO
(
   ID                   varchar(36) not null,
   NAME                 varchar(20),
   GENDER               varchar(2),
   WORK                 varchar(100),
   CONCAT_PHONE         varchar(30),
   BIRTHDAY             datetime,
   AREA                 varchar(100),
   SPECIALTY            varchar(200),
   SELFDESC             varchar(300),
   AVATAR               varchar(100),
   PROFILE              text,
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   MODIFIEDID           varchar(36),
   MODIFIEDDATE         datetime,
   DELETEDFLAG          int,
   primary key (ID)
);

/*==============================================================*/
/* Table: TB_MSG_INFO                                           */
/*==============================================================*/
create table TB_MSG_INFO
(
   ID                   varchar(36) not null,
   TITLE                varchar(100),
   MSGDESC              varchar(500),
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   primary key (ID)
);

/*==============================================================*/
/* Table: TB_NOTICE_INFO                                        */
/*==============================================================*/
create table TB_NOTICE_INFO
(
   ID                   varchar(36) not null,
   PURL                 varchar(100),
   NDESC                text,
   ATTACHMENT           varchar(100),
   CREATORID            varchar(36),
   CREATEDATE           datetime,
   MODIFIEDID           varchar(36),
   MODIFIEDDATE         datetime,
   DELETEDFLAG          int,
   primary key (ID)
);

