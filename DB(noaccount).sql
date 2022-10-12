--------------------------------------------------------
--  파일이 생성됨 - 목요일-10월-13-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HYEONJU"."MEMBER_SEQ"  MINVALUE 1000000 MAXVALUE 9999999 INCREMENT BY 1 START WITH 1000001 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "HYEONJU"."ADMIN" 
   (	"no" NUMBER, 
	"name" VARCHAR2(20 BYTE), 
	"id" VARCHAR2(20 BYTE), 
	"password" VARCHAR2(40 BYTE), 
	"dept" VARCHAR2(20 BYTE), 
	"rank" VARCHAR2(20 BYTE), 
	"email" VARCHAR2(20 BYTE), 
	"birth" DATE, 
	"tel" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BANK
--------------------------------------------------------

  CREATE TABLE "HYEONJU"."BANK" 
   (	"name" VARCHAR2(20 BYTE), 
	"rate" NUMBER DEFAULT 1.0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BANK_ACCOUNT
--------------------------------------------------------

  CREATE TABLE "HYEONJU"."BANK_ACCOUNT" 
   (	"bankNumber" NUMBER, 
	"id" VARCHAR2(20 BYTE), 
	"password" VARCHAR2(20 BYTE), 
	"balance" NUMBER, 
	"rate" VARCHAR2(20 BYTE), 
	"status" VARCHAR2(20 BYTE), 
	"name" VARCHAR2(20 BYTE), 
	"creationDate" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DEAL
--------------------------------------------------------

  CREATE TABLE "HYEONJU"."DEAL" 
   (	"no" NUMBER, 
	"type" VARCHAR2(20 BYTE), 
	"date" DATE, 
	"hostBank" VARCHAR2(20 BYTE), 
	"hostBankAccount" VARCHAR2(20 BYTE), 
	"targetBank" VARCHAR2(20 BYTE), 
	"targetBankAccount" VARCHAR2(20 BYTE), 
	"balance" NUMBER, 
	"targetShow" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "HYEONJU"."MEMBER" 
   (	"no" NUMBER, 
	"name" VARCHAR2(20 BYTE), 
	"id" VARCHAR2(20 BYTE), 
	"password" VARCHAR2(40 BYTE), 
	"birth" VARCHAR2(20 BYTE), 
	"email" VARCHAR2(20 BYTE), 
	"tel" VARCHAR2(20 BYTE), 
	"addr" VARCHAR2(20 BYTE), 
	"gender" VARCHAR2(20 BYTE), 
	"rank" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "HYEONJU"."POST" 
   (	"no" NUMBER, 
	"title" VARCHAR2(50 BYTE), 
	"writer" VARCHAR2(20 BYTE), 
	"contents" VARCHAR2(2048 BYTE), 
	"date" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into HYEONJU.ADMIN
SET DEFINE OFF;
REM INSERTING into HYEONJU.BANK
SET DEFINE OFF;
REM INSERTING into HYEONJU.BANK_ACCOUNT
SET DEFINE OFF;
REM INSERTING into HYEONJU.DEAL
SET DEFINE OFF;
REM INSERTING into HYEONJU.MEMBER
SET DEFINE OFF;
REM INSERTING into HYEONJU.POST
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ADMIN_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "HYEONJU"."ADMIN_NO" ON "HYEONJU"."ADMIN" ("no") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HYEONJU"."POST_PK" ON "HYEONJU"."POST" ("no") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HYEONJU"."MEMBER_PK" ON "HYEONJU"."MEMBER" ("no") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BANK_NAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "HYEONJU"."BANK_NAME" ON "HYEONJU"."BANK" ("name") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BANK_ACCOUNT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HYEONJU"."BANK_ACCOUNT_PK" ON "HYEONJU"."BANK_ACCOUNT" ("bankNumber") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HYEONJU"."TABLE1_PK" ON "HYEONJU"."DEAL" ("no") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table DEAL
--------------------------------------------------------

  ALTER TABLE "HYEONJU"."DEAL" MODIFY ("no" NOT NULL ENABLE);
  ALTER TABLE "HYEONJU"."DEAL" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("no")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "HYEONJU"."POST" MODIFY ("no" NOT NULL ENABLE);
  ALTER TABLE "HYEONJU"."POST" ADD CONSTRAINT "POST_PK" PRIMARY KEY ("no")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BANK
--------------------------------------------------------

  ALTER TABLE "HYEONJU"."BANK" MODIFY ("name" NOT NULL ENABLE);
  ALTER TABLE "HYEONJU"."BANK" MODIFY ("rate" NOT NULL ENABLE);
  ALTER TABLE "HYEONJU"."BANK" ADD CONSTRAINT "BANK_NAME" PRIMARY KEY ("name")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HYEONJU"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("no")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "HYEONJU"."MEMBER" MODIFY ("no" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "HYEONJU"."ADMIN" ADD CONSTRAINT "ADMIN_NO" PRIMARY KEY ("no")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "HYEONJU"."ADMIN" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BANK_ACCOUNT
--------------------------------------------------------

  ALTER TABLE "HYEONJU"."BANK_ACCOUNT" MODIFY ("bankNumber" NOT NULL ENABLE);
  ALTER TABLE "HYEONJU"."BANK_ACCOUNT" ADD CONSTRAINT "BANK_ACCOUNT_PK" PRIMARY KEY ("bankNumber")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
