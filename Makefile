#
# Makefile
# mhristof, 2016-03-31 13:55
#

NAME = mhristof/ansible-1.9.4
# VERSION = 8

default: build

tag:
	docker tag $(NAME) $(NAME):$(VERSION)
	docker tag $(NAME) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)
	docker push $(NAME):latest

build:
	docker build -t mhristof/ansible-1.9.4 .

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
