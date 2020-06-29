# check if needed binaries exist
EXECUTABLES = curl jq sort egrep tail
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

# if no version given, use the lates open source one
ifndef $VERSION
    VERSION = $(shell curl -sL https://releases.hashicorp.com/consul/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'beta|rc|alpha|ent' | tail -1)
    $(warning consul version undefined - assuming latest oss version v.${VERSION})
endif

default: all

all: xenial-consul-${VERSION}.box

xenial-consul-${VERSION}.box: template.json scripts/provision.sh http/preseed.cfg
	@echo "Building xenial-consul v.${VERSION}"
	packer validate template.json
	packer build -force -only=xenial-consul -var version='${VERSION}' template.json
	#vagrant box add --force --name xenial-consul --box-version ${VERSION} ./xenial-consul-${VERSION}.box  

publish: xenial-consul-${VERSION}.box
ifneq (,$(findstring ent,$(VERSION)))
	@echo publishing ENT version to krastin/xenial-consul-enterprise
	vagrant cloud publish --box-version $(firstword $(subst +, ,$(VERSION))) --force --release krastin/xenial-consul-enterprise $(firstword $(subst +, ,$(VERSION))) virtualbox xenial-consul-${VERSION}.box
else
	@echo publishing OSS version to krastin/xenial-consul
	vagrant cloud publish --box-version ${VERSION} --force --release krastin/xenial-consul ${VERSION} virtualbox xenial-consul-${VERSION}.box
endif

test: xenial-consul-${VERSION}.box
	bundle exec kitchen test default-krastin-xenial-consul

.PHONY: clean 
clean:
	-bundle exec kitchen destroy
	-vagrant box remove -f xenial-consul --provider virtualbox
	-rm -fr output-*/ *.box