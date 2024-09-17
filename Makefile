m ?= $(shell date +%Y-%m-%d)
c ?= $(shell date +%Y-%m-%d)
BUILD_DIR := build
ENV_FILE := .env
include $(ENV_FILE)


.PHONY: pre_build
all: pre_build


v_find:
	sudo /usr/local/vcpkg/vcpkg search "$(p)"
v_install:
	sudo /usr/local/vcpkg/vcpkg install

clean:
	rm -rf ./build
	rm -rf ./vcpkg_installed 

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

pre_build_release:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	cmake .. \
	-DAPP_NAME="$(APP_NAME)" \
	-DBUILD_MODE="Release" \
	-DCMAKE_TOOLCHAIN_FILE="$(CMAKE_TOOLCHAIN_FILE)" \
	-DVCPKG_TARGET_TRIPLET="$(VCPKG_TARGET_TRIPLET)" \
	&& \
	make

pre_build_debug:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	cmake .. \
	-DAPP_NAME="$(APP_NAME)" \
	-DBUILD_MODE="Debug" \
	-DCMAKE_TOOLCHAIN_FILE="$(CMAKE_TOOLCHAIN_FILE)" \
	-DVCPKG_TARGET_TRIPLET="$(VCPKG_TARGET_TRIPLET)" \
	&& \
	make

pre_run:pre_build_release
	./build/"$(APP_NAME)"
