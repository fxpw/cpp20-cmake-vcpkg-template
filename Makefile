m ?= $(shell date +%Y-%m-%d)
c ?= $(shell date +%Y-%m-%d)
BUILD_DIR := build
ENV_FILE := .env
include $(ENV_FILE)

v_find:
	sudo /usr/local/vcpkg/vcpkg search "$(p)"
v_install:
	sudo /usr/local/vcpkg/vcpkg install

.PHONY: pre_build
all: pre_build
d_build:
	docker compose build
d_build_no_cache:
	docker compose build --no-cache
d_stop:
	docker compose down
d_down:
	docker compose down
d_run:
	docker compose up -d
d_up:
	docker compose up -d
d_start:
	docker compose up -d
d_build_start:
	docker compose build
d_rebuild: down build_no_cache up
	echo "rebuild"

pre_build:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	cmake .. -DAPP_NAME="$(APP_NAME)" && \
	make

pre_run:pre_build
	./build/"$(APP_NAME)"