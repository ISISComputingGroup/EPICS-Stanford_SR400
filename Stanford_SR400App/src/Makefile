TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = Stanford_SR400
# Stanford_SR400.dbd will be created and installed
DBD += Stanford_SR400.dbd

# Stanford_SR400.dbd will be made up from these files:
Stanford_SR400_DBD += base.dbd

# Include dbd files from all support applications:
#Stanford_SR400_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#Stanford_SR400_LIBS += xxx

# Stanford_SR400_registerRecordDeviceDriver.cpp derives from Stanford_SR400.dbd
Stanford_SR400_SRCS += Stanford_SR400_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
Stanford_SR400_SRCS_DEFAULT += Stanford_SR400Main.cpp
Stanford_SR400_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#Stanford_SR400_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

Stanford_SR400_LIBS +=  lvDCOMSupport asyn
Stanford_SR400_SYS_LIBS_WIN32 += msxml2

# Finally link to the EPICS Base libraries
Stanford_SR400_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

