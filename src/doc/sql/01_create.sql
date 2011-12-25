CREATE TABLE TB_PROJECT_MEMBER (PRJ_MBR_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_ID bigint(19) NOT NULL, USR_LOGIN_ID varchar(20) NOT NULL, ROLE_CD bigint(19) NOT NULL, ACT_IND tinyint(1) DEFAULT 1 NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(11) NOT NULL, PRIMARY KEY (PRJ_MBR_ID));
CREATE TABLE TB_PROJECT_PROPOSAL (PRJ_PROP_ID bigint(19) NOT NULL AUTO_INCREMENT, NME varchar(100) NOT NULL, `DESC` varchar(255), CTRY_CD bigint(19) NOT NULL, LOC varchar(255) NOT NULL, EST_DUR int(2) NOT NULL, PROPOSER_ID varchar(20) NOT NULL, APPR_BY varchar(20), APPR_DTE datetime NULL, STS_CD bigint(19) NOT NULL, RMK varchar(500), CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY bigint(20) NOT NULL, UPS_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PRJ_PROP_ID));
CREATE TABLE TB_DOCUMENT (DOC_ID bigint(19) NOT NULL AUTO_INCREMENT, FLE_NME varchar(100) NOT NULL, FLE blob NOT NULL, `DESC` varchar(255), DEL_IND tinyint(1) DEFAULT 0 NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (DOC_ID));
CREATE TABLE TB_USER (USR_ID bigint(19) NOT NULL AUTO_INCREMENT, USR_LOGIN_ID varchar(20) NOT NULL UNIQUE, TP_CD bigint(19) NOT NULL, TITLE_CD bigint(19) NOT NULL, NME varchar(100) NOT NULL, EMAIL varchar(100) NOT NULL, PWD varchar(50) NOT NULL, MOBILE varchar(100), ADDR varchar(255), POST_CD int(6), CTRY_CD bigint(19), ACT_IND tinyint(1) DEFAULT 0 NOT NULL, JOIN_DTE datetime NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (USR_ID));
CREATE TABLE TB_USER_DETAIL (USR_DTL_ID bigint(19) NOT NULL AUTO_INCREMENT, USR_ID bigint(19) NOT NULL UNIQUE, INTRST varchar(255), SKILL_SET varchar(255), QUAL_ATT varchar(255), JOB_TITLE_CD bigint(19), SALARY decimal(14, 2), PRIMARY KEY (USR_DTL_ID));
CREATE TABLE TB_PROJECT_FEEDBACK (PRJ_FB_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_ID bigint(19) NOT NULL, TITLE varchar(100) NOT NULL, CONT text NOT NULL, APPR_BY varchar(20), APPR_DTE datetime NULL, STS_CD bigint(19) DEFAULT 0 NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY bigint(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PRJ_FB_ID));
CREATE TABLE TB_PROJECT_INTREST (PRJ_INTRST_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_ID bigint(19) NOT NULL, REQ_BY varchar(20) NOT NULL, APPR_BY varchar(20), APPR_DTE datetime NULL, APPR_RMK varchar(255), STS_CD bigint(19) NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PRJ_INTRST_ID));
CREATE TABLE TB_EVENT_CAL (EVNT_ID bigint(19) NOT NULL AUTO_INCREMENT, EVNT_NME varchar(100) NOT NULL, EVNT_TYPE bigint(19), EVNT_DATE datetime NOT NULL, CREATED_BY bigint(19) NOT NULL, TX_ID bigint(19) NOT NULL, PRIMARY KEY (EVNT_ID));
CREATE TABLE TB_PROJECT (PRJ_ID bigint(19) NOT NULL AUTO_INCREMENT, NME varchar(100) NOT NULL, `DESC` varchar(255) NOT NULL, PRJ_MGR varchar(20), STR_DTE datetime NOT NULL, END_DTE datetime NOT NULL, CTRY_CD bigint(19) NOT NULL, LOC varchar(255) NOT NULL, RMK varchar(500), PRJ_PROP_ID bigint(19) NOT NULL, STS_CD bigint(19) NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATE_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PRJ_ID));
CREATE TABLE TB_PROJECT_TASK (PRJ_TASK_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_ID bigint(19) NOT NULL, NME varchar(100) NOT NULL, `DESC` varchar(255), ODR_NO int(3) NOT NULL, STR_DTE datetime NOT NULL, END_DTE datetime NOT NULL, STS_CD bigint(19) NOT NULL, DEL_IND tinyint(1) DEFAULT 0, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY bigint(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PRJ_TASK_ID));
CREATE TABLE TB_PROJECT_TASK_MEMBER (PRJ_TASK_MBR_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_TASK_ID bigint(19) NOT NULL, USR_LOGIN_ID varchar(20) NOT NULL, ACT_IND tinyint(1) DEFAULT 0 NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PRJ_TASK_MBR_ID));
CREATE TABLE TB_CODE (CD_ID bigint(19) NOT NULL AUTO_INCREMENT, CAT_ID bigint(19) NOT NULL, VAL varchar(50) NOT NULL, `DESC` varchar(100) NOT NULL, PRIMARY KEY (CD_ID));
CREATE TABLE TB_CODE_CATEGORY (CAT_ID bigint(19) NOT NULL AUTO_INCREMENT, NME varchar(50) NOT NULL, `DESC` varchar(255), PRIMARY KEY (CAT_ID));
CREATE TABLE TB_PROJECT_EXPERENCE (PRJ_EXP_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_ID bigint(19) NOT NULL, CONT text NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE varchar(20) NOT NULL, PRIMARY KEY (PRJ_EXP_ID));
CREATE TABLE TB_PROJECT_PROPOSAL_DOCUMENT (PROP_DOC_ID bigint(19) NOT NULL AUTO_INCREMENT, PRJ_PROP_ID bigint(19) NOT NULL, DOC_ID bigint(19) NOT NULL, PRIMARY KEY (PROP_DOC_ID));
CREATE TABLE TB_USER_ROLE (USR_ROLE_ID bigint(19) NOT NULL AUTO_INCREMENT, ROLE_ID bigint(19) NOT NULL, USR_ID bigint(19) NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (USR_ROLE_ID));
CREATE TABLE TB_ROLE (ROLE_ID bigint(19) NOT NULL AUTO_INCREMENT, ROLE_CD bigint(20) NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION datetime NOT NULL, PRIMARY KEY (ROLE_ID));
CREATE TABLE TB_PERMISSION_ROLE (PERMI_ROLE_ID bigint(19) NOT NULL AUTO_INCREMENT, PERMI_ID bigint(19) NOT NULL, ROLE_ID bigint(19) NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PERMI_ROLE_ID));
CREATE TABLE TB_MENU_FUNCTION (MENU_FUNC_ID bigint(19) NOT NULL AUTO_INCREMENT, PERMI_ID bigint(19) NOT NULL, PRNT_MENU_FUNC_ID bigint(19) NOT NULL, MENU_FUNC_NME varchar(100) NOT NULL, CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (MENU_FUNC_ID));
CREATE TABLE TB_PERMISSION (PERMI_ID bigint(19) NOT NULL AUTO_INCREMENT, URI varchar(1000) NOT NULL, `DESC` varchar(200), CREATED_BY varchar(20) NOT NULL, CREATED_DTE datetime NOT NULL, UPD_BY varchar(20) NOT NULL, UPD_DTE datetime NOT NULL, VERSION int(10) NOT NULL, PRIMARY KEY (PERMI_ID));
ALTER TABLE TB_USER_DETAIL ADD INDEX FKTB_USER_DE115797 (USR_ID), ADD CONSTRAINT FKTB_USER_DE115797 FOREIGN KEY (USR_ID) REFERENCES TB_USER (USR_ID);
ALTER TABLE TB_PROJECT_TASK ADD INDEX FKTB_PROJECT627018 (PRJ_ID), ADD CONSTRAINT FKTB_PROJECT627018 FOREIGN KEY (PRJ_ID) REFERENCES TB_PROJECT (PRJ_ID);
ALTER TABLE TB_PROJECT_FEEDBACK ADD INDEX FKTB_PROJECT303640 (PRJ_ID), ADD CONSTRAINT FKTB_PROJECT303640 FOREIGN KEY (PRJ_ID) REFERENCES TB_PROJECT (PRJ_ID);
ALTER TABLE TB_PROJECT_MEMBER ADD INDEX FKTB_PROJECT662350 (PRJ_ID), ADD CONSTRAINT FKTB_PROJECT662350 FOREIGN KEY (PRJ_ID) REFERENCES TB_PROJECT (PRJ_ID);
ALTER TABLE TB_PROJECT_TASK_MEMBER ADD INDEX FKTB_PROJECT235243 (PRJ_TASK_ID), ADD CONSTRAINT FKTB_PROJECT235243 FOREIGN KEY (PRJ_TASK_ID) REFERENCES TB_PROJECT_TASK (PRJ_TASK_ID);
ALTER TABLE TB_PROJECT_INTREST ADD INDEX FKTB_PROJECT169016 (PRJ_ID), ADD CONSTRAINT FKTB_PROJECT169016 FOREIGN KEY (PRJ_ID) REFERENCES TB_PROJECT (PRJ_ID);
ALTER TABLE TB_CODE ADD INDEX FKTB_CODE317331 (CAT_ID), ADD CONSTRAINT FKTB_CODE317331 FOREIGN KEY (CAT_ID) REFERENCES TB_CODE_CATEGORY (CAT_ID);
ALTER TABLE TB_PROJECT ADD INDEX FKTB_PROJECT334276 (PRJ_PROP_ID), ADD CONSTRAINT FKTB_PROJECT334276 FOREIGN KEY (PRJ_PROP_ID) REFERENCES TB_PROJECT_PROPOSAL (PRJ_PROP_ID);
ALTER TABLE TB_PROJECT_EXPERENCE ADD INDEX FKTB_PROJECT154073 (PRJ_ID), ADD CONSTRAINT FKTB_PROJECT154073 FOREIGN KEY (PRJ_ID) REFERENCES TB_PROJECT (PRJ_ID);
ALTER TABLE TB_PROJECT_PROPOSAL_DOCUMENT ADD INDEX FKTB_PROJECT324928 (DOC_ID), ADD CONSTRAINT FKTB_PROJECT324928 FOREIGN KEY (DOC_ID) REFERENCES TB_DOCUMENT (DOC_ID);
ALTER TABLE TB_PROJECT_PROPOSAL_DOCUMENT ADD INDEX FKTB_PROJECT47632 (PRJ_PROP_ID), ADD CONSTRAINT FKTB_PROJECT47632 FOREIGN KEY (PRJ_PROP_ID) REFERENCES TB_PROJECT_PROPOSAL (PRJ_PROP_ID);
ALTER TABLE TB_PERMISSION_ROLE ADD INDEX FKTB_PERMISS30264 (PERMI_ID), ADD CONSTRAINT FKTB_PERMISS30264 FOREIGN KEY (PERMI_ID) REFERENCES TB_PERMISSION (PERMI_ID);
ALTER TABLE TB_PERMISSION_ROLE ADD INDEX FKTB_PERMISS997181 (ROLE_ID), ADD CONSTRAINT FKTB_PERMISS997181 FOREIGN KEY (ROLE_ID) REFERENCES TB_ROLE (ROLE_ID);
ALTER TABLE TB_USER_ROLE ADD INDEX FKTB_USER_RO554008 (ROLE_ID), ADD CONSTRAINT FKTB_USER_RO554008 FOREIGN KEY (ROLE_ID) REFERENCES TB_ROLE (ROLE_ID);
ALTER TABLE TB_MENU_FUNCTION ADD INDEX FKTB_MENU_FU354806 (PERMI_ID), ADD CONSTRAINT FKTB_MENU_FU354806 FOREIGN KEY (PERMI_ID) REFERENCES TB_PERMISSION (PERMI_ID);

/*
CREATE TABLE TB_ROLE (
ROLE_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'The primary key of TB_ROLE.',
ROLE_CD VARCHAR(20) COMMENT 'The role code. Refer to code type ''. ',
CREATED_BY VARCHAR(66) NOT NULL COMMENT 'Record created by.',
CREATED_TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Recordcreation date.',
LS_UPD_BY VARCHAR(66) NOT NULL COMMENT 'Record ast modified by.',
LS_UPD_TS TIMESTAMP NOT NULL COMMENT 'Record last modified by.',
VERSION INT NOT NULL COMMENT 'The version number of the current record.  For the new created record, the version number should be 1. Increments by one, each time the record is updated.  Used to prevent concurrent update via the web front-end.'
);

CREATE TABLE TB_USER_ROLE (
USR_ROLE_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'The primary key of TB_USER_ROLE.',
USR_SEQ_ID INT NOT NULL COMMENT 'The primary key of TB_USER.',
ROLE_ID INT NOT NULL COMMENT 'The primary key of TB_ROLE.',
CREATED_BY VARCHAR(66) NOT NULL,
CREATED_TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Recordcreation date.',
LS_UPD_BY VARCHAR(66) NOT NULL COMMENT 'Record ast modified by.',
LS_UPD_TS TIMESTAMP NOT NULL COMMENT 'Record last modified by.',
VERSION INT NOT NULL COMMENT 'The version number of the current record.  For the new created record, the version number should be 1. Increments by one, each time the record is updated.  Used to prevent concurrent update via the web front-end.'
);

CREATE TABLE TB_PERMISSION (
PERMI_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'The primary key of TB_PERMISSION.',
URI VARCHAR(1000) NOT NULL COMMENT 'The unique request identifier of the URL or button.',
PERMI_DESC VARCHAR(200) COMMENT 'The description of the permission.',
CREATED_BY VARCHAR(66) NOT NULL COMMENT 'Record created by.',
CREATED_TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Recordcreation date.',
LS_UPD_BY VARCHAR(66) NOT NULL COMMENT 'Record ast modified by.',
LS_UPD_TS TIMESTAMP NOT NULL COMMENT 'Record last modified by.',
VERSION INT NOT NULL COMMENT 'The version number of the current record.  For the new created record, the version number should be 1. Increments by one, each time the record is updated.  Used to prevent concurrent update via the web front-end.'
);

CREATE TABLE TB_PERMISSION_ROLE (
PERMI_ROLE_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'The primary key of TB_PERMISSION_ROLE.',
ROLE_ID INT COMMENT 'The role ID that ties to this permission.',
CREATED_BY VARCHAR(66) NOT NULL COMMENT 'Record created by.',
CREATED_TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Recordcreation date.',
LS_UPD_BY VARCHAR(66) NOT NULL COMMENT 'Record ast modified by.',
LS_UPD_TS TIMESTAMP NOT NULL COMMENT 'Record last modified by.',
VERSION INT NOT NULL COMMENT 'The version number of the current record.  For the new created record, the version number should be 1. Increments by one, each time the record is updated.  Used to prevent concurrent update via the web front-end.'
);

CREATE TABLE TB_MENU_FUNCTION (
MENU_FUNC_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'The primary key of TB_MENU_FUNCTION.',
PERMI_ID INT COMMENT 'The primary key of TB_PERMISSION.',
PRNT_MENU_FUNC_ID VARCHAR(100)COMMENT 'Parent of the menu or function.',
MENU_FUNC_NME VARCHAR(100) COMMENT 'The name of the menu or function.',
CREATED_TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Recordcreation date.',
LS_UPD_BY VARCHAR(66) NOT NULL COMMENT 'Record ast modified by.',
LS_UPD_TS TIMESTAMP NOT NULL COMMENT 'Record last modified by.',
VERSION INT NOT NULL COMMENT 'The version number of the current record.  For the new created record, the version number should be 1. Increments by one, each time the record is updated.  Used to prevent concurrent update via the web front-end.'
);
*/