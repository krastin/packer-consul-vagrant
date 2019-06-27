vm-provider := vbox

default: all

all: xenial-consul-vbox.box

xenial-consul-vbox.box: template.json scripts/provision.sh http/preseed.cfg
	packer validate template.json
	packer build -force -only=xenial-consul-vbox template.json
	vagrant box add ./xenial-consul-vbox.box  --name xenial-consul

test: xenial-consul-vbox.box
	bundle exec kitchen test vbox

.PHONY: clean
clean:
    -bundle exec kitchen destroy
	-vagrant box remove -f xenial-consul --provider virtualbox
	-rm -fr output-*/ *.box