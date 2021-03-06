#!../../bin/windows-x64/Stanford_SR400

## You may have to change Stanford_SR400 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))STSR400"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/Stanford_SR400.dbd"
Stanford_SR400_registerRecordDeviceDriver pdbbase

cd ${TOP}/iocBoot/${IOC}

# Turn on asynTraceFlow and asynTraceError for global trace, i.e. no connected asynUser.
#asynSetTraceMask("", 0, 17)

## main args are:  portName, configSection, configFile, host, options (see lvDCOMConfigure() documentation in lvDCOMDriver.cpp)
##
## there are additional optional args to specify a DCOM ProgID for a compiled LabVIEW application 
## and a different username + password for remote host if that is required 
##
## the "options" argument is a combination of the following flags (as per the #lvDCOMOptions enum in lvDCOMInterface.h)
##    viWarnIfIdle=1, viStartIfIdle=2, viStopOnExitIfStarted=4, viAlwaysStopOnExit=8
lvDCOMConfigure("ex1", "frontpanel", "$(TOP)/Stanford_SR400App/protocol/StanfordSR400.xml", "ndxchipir", 6, "", "spudulike", "reliablebeam")
#lvDCOMConfigure("ex1", "frontpanel", "$(TOP)/Stanford_SR400App/protocol/StanfordSR400.xml", "", 6)

dbLoadRecords("$(TOP)/db/Stanford_SR400.db","P=$(IOCNAME):")
dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

#asynSetTraceMask("frontpanel",0,0xff)
asynSetTraceIOMask("ex1",0,0x2)

iocInit

