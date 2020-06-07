ifeq ($(PACKAGE_SET),dom0)
ifeq ($(DISTRIBUTION),centos)
  RPM_SPEC_FILES := edk2.spec
endif
endif

NO_ARCHIVE := 1
