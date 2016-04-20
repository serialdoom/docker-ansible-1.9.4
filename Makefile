#
# Makefile
# mhristof, 2016-03-31 13:55
#

ANSIBLE_VERSION = 1.9.4
NAME = mhristof/ansible-$(ANSIBLE_VERSION)
# VERSION = 9.1

default: build

tag:
	docker tag $(NAME) $(NAME):$(VERSION)
	docker tag $(NAME) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)
	docker push $(NAME):latest

build:
	docker build --build-arg ansible_version=$(ANSIBLE_VERSION) -t mhristof/ansible-$(ANSIBLE_VERSION) .

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
