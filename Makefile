ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MAKE_DIR = $(ROOT_DIR)/.make

init: MAKE_URI = https://raw.githubusercontent.com/daemonite-labs/make
init: MAKE_VERSION = v0
init: MAKE_FILES = lint terraform
init:
	@rm -rf $(MAKE_DIR) && mkdir -p $(MAKE_DIR)
	@for MAKE_FILE in $(MAKE_FILES); do docker run --rm curlimages/curl -sSL $(MAKE_URI)/$(MAKE_VERSION)/src/$${MAKE_FILE}.mk > $(MAKE_DIR)/$${MAKE_FILE}.mk; done

TF_VERSION = 1.11.4

-include $(MAKE_DIR)/*.mk
