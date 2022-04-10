
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) CLV1
SHELL=/QOpenSys/usr/bin/qsh

all: customers.sql customers1.sql customers.bnd customers.sqlrpgle customers_h.rpgle

customers.sqlrpgle: customers_h.rpgle customers.bnd

customers1.sql: customers.sql

%.sqlrpgle:
	system -s "CHGATR OBJ('/home/CLV/customers/qrpglesrc/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('/home/CLV/customers/qrpglesrc/$*.sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF) OBJTYPE(*MODULE) RPGPPOPT(*LVL2)"
	system "CRTSRVPGM SRVPGM($(BIN_LIB)/$*) MODULE($(BIN_LIB)/$*) EXPORT(*SRCFILE) SRCSTMF('/home/CLV/customers/qsrvsrc/$*.bnd')"
	system "DLTOBJ OBJ($(BIN_LIB)/$*) OBJTYPE(*MODULE)"

%.rpgle:
	system -s "CHGATR OBJ('/home/CLV/customers/qrpglesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"

%.bnd:
	system -s "CHGATR OBJ('/home/CLV/customers/qsrvsrc/$*.bnd') ATR(*CCSID) VALUE(1252)"

%.sql:
	system -s "CHGATR OBJ('/home/CLV/customers/qsqlsrc/$*.sql') ATR(*CCSID) VALUE(1252)"
	system -s "RUNSQLSTM SRCSTMF('/home/CLV/customers/qsqlsrc/$*.sql') COMMIT(*NONE)"

