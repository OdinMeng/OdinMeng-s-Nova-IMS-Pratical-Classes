/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     10/10/2023 11:35:48                          */
/*==============================================================*/

USE MASTER 
GO

CREATE DATABASE TVShows
GO

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EPISODES') and o.name = 'FK_EPISODES_DIRECTS')
alter table EPISODES
   drop constraint FK_EPISODES_DIRECTS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EPISODES') and o.name = 'FK_EPISODES_IS_PART_OF')
alter table EPISODES
   drop constraint FK_EPISODES_IS_PART_OF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FUNCTIONS') and o.name = 'FK_FUNCTIONS_PERFORMED_BY')
alter table FUNCTIONS
   drop constraint FK_FUNCTIONS_PERFORMED_BY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FUNCTIONS') and o.name = 'FK_FUNCTIONS_WORKS_IN')
alter table FUNCTIONS
   drop constraint FK_FUNCTIONS_WORKS_IN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROLES') and o.name = 'FK_ROLES_PLAYED_BY')
alter table ROLES
   drop constraint FK_ROLES_PLAYED_BY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROLES') and o.name = 'FK_ROLES_PLAYED_IN')
alter table ROLES
   drop constraint FK_ROLES_PLAYED_IN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SCENES') and o.name = 'FK_SCENES_PART_OF')
alter table SCENES
   drop constraint FK_SCENES_PART_OF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SEASONS') and o.name = 'FK_SEASONS_BELONGS_TO')
alter table SEASONS
   drop constraint FK_SEASONS_BELONGS_TO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TVSHOW_GENRES') and o.name = 'FK_TVSHOW_GENRES_TVSHOW_GENRES')
alter table TVSHOW_GENRES
   drop constraint FK_TVSHOW_GENRES_TVSHOW_GENRES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TVSHOW_GENRES') and o.name = 'FK_TVSHOW_GENRES_TVSHOW_GENRES2')
alter table TVSHOW_GENRES
   drop constraint FK_TVSHOW_GENRES_TVSHOW_GENRES2
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EPISODES')
            and   name  = 'DIRECTS_FK'
            and   indid > 0
            and   indid < 255)
   drop index EPISODES.DIRECTS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EPISODES')
            and   name  = 'IS_PART_OF_FK'
            and   indid > 0
            and   indid < 255)
   drop index EPISODES.IS_PART_OF_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EPISODES')
            and   type = 'U')
   drop table EPISODES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FUNCTIONS')
            and   name  = 'PERFORMED_BY_FK'
            and   indid > 0
            and   indid < 255)
   drop index FUNCTIONS.PERFORMED_BY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FUNCTIONS')
            and   name  = 'WORKS_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index FUNCTIONS.WORKS_IN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FUNCTIONS')
            and   type = 'U')
   drop table FUNCTIONS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GENRES')
            and   type = 'U')
   drop table GENRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERSONS')
            and   type = 'U')
   drop table PERSONS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ROLES')
            and   name  = 'PLAYED_BY_FK'
            and   indid > 0
            and   indid < 255)
   drop index ROLES.PLAYED_BY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ROLES')
            and   name  = 'PLAYED_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index ROLES.PLAYED_IN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROLES')
            and   type = 'U')
   drop table ROLES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SCENES')
            and   name  = 'PART_OF_FK'
            and   indid > 0
            and   indid < 255)
   drop index SCENES.PART_OF_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SCENES')
            and   type = 'U')
   drop table SCENES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SEASONS')
            and   name  = 'BELONGS_TO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SEASONS.BELONGS_TO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEASONS')
            and   type = 'U')
   drop table SEASONS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TVSHOWS')
            and   type = 'U')
   drop table TVSHOWS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TVSHOW_GENRES')
            and   name  = 'TVSHOW_GENRES2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TVSHOW_GENRES.TVSHOW_GENRES2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TVSHOW_GENRES')
            and   name  = 'TVSHOW_GENRES_FK'
            and   indid > 0
            and   indid < 255)
   drop index TVSHOW_GENRES.TVSHOW_GENRES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TVSHOW_GENRES')
            and   type = 'U')
   drop table TVSHOW_GENRES
go

/*==============================================================*/
/* Table: EPISODES                                              */
/*==============================================================*/
create table EPISODES (
   IDEPISODE            numeric              identity,
   IDDIRECTOR           numeric              not null,
   IDSEASON             numeric              not null,
   EPISODE_NR           smallint             not null,
   TITLE                varchar(50)          not null,
   DURATION             smallint             not null,
   SUMMARY              text                 not null,
   constraint PK_EPISODES primary key nonclustered (IDEPISODE),
   constraint UNIQUE_EPISODE_SEASON unique (IDSEASON, EPISODE_NR)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Duração do documentário em horas e minutos (hh:mm)',
   'user', @CurrentUser, 'table', 'EPISODES', 'column', 'DURATION'
go

/*==============================================================*/
/* Index: IS_PART_OF_FK                                         */
/*==============================================================*/
create index IS_PART_OF_FK on EPISODES (
IDSEASON ASC
)
go

/*==============================================================*/
/* Index: DIRECTS_FK                                            */
/*==============================================================*/
create index DIRECTS_FK on EPISODES (
IDDIRECTOR ASC
)
go

/*==============================================================*/
/* Table: FUNCTIONS                                             */
/*==============================================================*/
create table FUNCTIONS (
   IDSCENE              numeric              not null,
   IDPERSON             numeric              not null,
   IDFUNCTION           numeric              identity,
   "FUNCTION"           varchar(50)          not null,
   constraint PK_FUNCTIONS primary key nonclustered (IDSCENE, IDPERSON, IDFUNCTION)
)
go

/*==============================================================*/
/* Index: WORKS_IN_FK                                           */
/*==============================================================*/
create index WORKS_IN_FK on FUNCTIONS (
IDSCENE ASC
)
go

/*==============================================================*/
/* Index: PERFORMED_BY_FK                                       */
/*==============================================================*/
create index PERFORMED_BY_FK on FUNCTIONS (
IDPERSON ASC
)
go

/*==============================================================*/
/* Table: GENRES                                                */
/*==============================================================*/
create table GENRES (
   IDGENRE              numeric              identity,
   GENRE                varchar(30)          not null,
   constraint PK_GENRES primary key nonclustered (IDGENRE)
)
go

/*==============================================================*/
/* Table: PERSONS                                               */
/*==============================================================*/
create table PERSONS (
   IDPERSON             numeric              identity,
   NAME                 varchar(50)          not null,
   PHONE                varchar(15)          not null,
   EMAIL                varchar(30)          not null,
   OCCUPATION           varchar(20)          not null
      constraint CKC_OCCUPATION_PERSONS check (OCCUPATION in ('Actor','Director','Technician')),
   constraint PK_PERSONS primary key nonclustered (IDPERSON)
)
go

/*==============================================================*/
/* Table: ROLES                                                 */
/*==============================================================*/
create table ROLES (
   IDSCENE              numeric              not null,
   IDPERSON             numeric              not null,
   ROLE                 varchar(50)          not null,
   constraint PK_ROLES primary key (IDSCENE, IDPERSON)
)
go

/*==============================================================*/
/* Index: PLAYED_IN_FK                                          */
/*==============================================================*/
create index PLAYED_IN_FK on ROLES (
IDSCENE ASC
)
go

/*==============================================================*/
/* Index: PLAYED_BY_FK                                          */
/*==============================================================*/
create index PLAYED_BY_FK on ROLES (
IDPERSON ASC
)
go

/*==============================================================*/
/* Table: SCENES                                                */
/*==============================================================*/
create table SCENES (
   IDSCENE              numeric              identity,
   IDEPISODE            numeric              not null,
   SCENE_NR             smallint             not null,
   DATEFILMED           datetime             null default '0',
   SCENARIO             varchar(30)          null,
   STUDIO               varchar(20)          null,
   LOCATION             varchar(30)          null,
   LANDSCAPETYPE        varchar(30)          null,
   constraint PK_SCENES primary key nonclustered (IDSCENE),
   constraint UNIQUE_SCENE_EPISODE unique (IDEPISODE, SCENE_NR)
)
go

/*==============================================================*/
/* Index: PART_OF_FK                                            */
/*==============================================================*/
create index PART_OF_FK on SCENES (
IDEPISODE ASC
)
go

/*==============================================================*/
/* Table: SEASONS                                               */
/*==============================================================*/
create table SEASONS (
   IDSEASON             numeric              identity,
   IDTVSHOW             numeric              not null,
   SEASON_NR            smallint             not null,
   RELEASEDATE          datetime             not null,
   constraint PK_SEASONS primary key nonclustered (IDSEASON),
   constraint UNIQUE_SEASON_SHOW unique (IDTVSHOW, SEASON_NR)
)
go

/*==============================================================*/
/* Index: BELONGS_TO_FK                                         */
/*==============================================================*/
create index BELONGS_TO_FK on SEASONS (
IDTVSHOW ASC
)
go

/*==============================================================*/
/* Table: TVSHOWS                                               */
/*==============================================================*/
create table TVSHOWS (
   IDTVSHOW             numeric              identity,
   TITLE                varchar(50)          not null,
   RELEASEYEAR          smallint             not null,
   RATING               real                 null
      constraint CKC_RATING_TVSHOWS check (RATING is null or (RATING between 0 and 10)),
   constraint PK_TVSHOWS primary key nonclustered (IDTVSHOW)
)
go

/*==============================================================*/
/* Table: TVSHOW_GENRES                                         */
/*==============================================================*/
create table TVSHOW_GENRES (
   IDGENRE              numeric              not null,
   IDTVSHOW             numeric              not null,
   constraint PK_TVSHOW_GENRES primary key (IDGENRE, IDTVSHOW)
)
go

/*==============================================================*/
/* Index: TVSHOW_GENRES_FK                                      */
/*==============================================================*/
create index TVSHOW_GENRES_FK on TVSHOW_GENRES (
IDGENRE ASC
)
go

/*==============================================================*/
/* Index: TVSHOW_GENRES2_FK                                     */
/*==============================================================*/
create index TVSHOW_GENRES2_FK on TVSHOW_GENRES (
IDTVSHOW ASC
)
go

alter table EPISODES
   add constraint FK_EPISODES_DIRECTS foreign key (IDDIRECTOR)
      references PERSONS (IDPERSON)
go

alter table EPISODES
   add constraint FK_EPISODES_IS_PART_OF foreign key (IDSEASON)
      references SEASONS (IDSEASON)
go

alter table FUNCTIONS
   add constraint FK_FUNCTIONS_PERFORMED_BY foreign key (IDPERSON)
      references PERSONS (IDPERSON)
go

alter table FUNCTIONS
   add constraint FK_FUNCTIONS_WORKS_IN foreign key (IDSCENE)
      references SCENES (IDSCENE)
go

alter table ROLES
   add constraint FK_ROLES_PLAYED_BY foreign key (IDPERSON)
      references PERSONS (IDPERSON)
go

alter table ROLES
   add constraint FK_ROLES_PLAYED_IN foreign key (IDSCENE)
      references SCENES (IDSCENE)
go

alter table SCENES
   add constraint FK_SCENES_PART_OF foreign key (IDEPISODE)
      references EPISODES (IDEPISODE)
go

alter table SEASONS
   add constraint FK_SEASONS_BELONGS_TO foreign key (IDTVSHOW)
      references TVSHOWS (IDTVSHOW)
go

alter table TVSHOW_GENRES
   add constraint FK_TVSHOW_GENRES_TVSHOW_GENRES foreign key (IDGENRE)
      references GENRES (IDGENRE)
go

alter table TVSHOW_GENRES
   add constraint FK_TVSHOW_GENRES_TVSHOW_GENRES2 foreign key (IDTVSHOW)
      references TVSHOWS (IDTVSHOW)
go

