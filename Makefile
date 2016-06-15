#
# Makefile
# mhristof, 2016-03-31 13:55
#

ANSIBLE_VERSION = 2.1.0.0
NAME = mhristof/ansible-$(ANSIBLE_VERSION)
VERSION = 0.2.2

default: build

tag:
	docker tag $(NAME) $(NAME):$(VERSION)
	docker tag $(NAME) $(NAME):latest
	git tag $(VERSION)

push:
	git push --tags
	docker push $(NAME):$(VERSION)
	docker push $(NAME):latest

build:
	docker build --build-arg ansible_version=$(ANSIBLE_VERSION) -t mhristof/ansible-$(ANSIBLE_VERSION) .

test: test-ansible test-shellcheck test-flake8 test-pip test-mysql

test-%:
	docker run -P $(NAME) $* --version


all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
