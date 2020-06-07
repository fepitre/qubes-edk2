DIST ?= centos8

SRC_FILE := edk2-89910a39dcfd.tar.xz openssl-fedora-d2ede125556ac99aa0faa7744c703af3f559094e.tar.xz

DISTFILES_MIRROR ?= https://ftp.qubes-os.org/distfiles/
UNTRUSTED_SUFF := .UNTRUSTED
FETCH_CMD := wget --no-use-server-timestamps -q -O

SHELL := /bin/bash

%: %.sha1
	@$(FETCH_CMD) $@$(UNTRUSTED_SUFF) $(DISTFILES_MIRROR)$@
	@shasum --status -c <(printf "$$(cat $<)  -\n") <$@$(UNTRUSTED_SUFF) || \
		{ echo "Wrong SHA512 checksum on $@$(UNTRUSTED_SUFF)!"; exit 1; }
	@mv $@$(UNTRUSTED_SUFF) $@

.PHONY: get-sources
get-sources: $(SRC_FILE)

.PHONY: verify-sources
verify-sources:
	@true
