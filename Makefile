CURRENT_DIRECTORY := $(shell pwd)

build: config
	@docker build --tag=cloudcss/av-avast $(CURRENT_DIRECTORY)/avast
	@docker build --tag=cloudcss/av-avg $(CURRENT_DIRECTORY)/avg
	@docker build --tag=cloudcss/av-avira $(CURRENT_DIRECTORY)/avira
	@docker build --tag=cloudcss/av-bitdefender $(CURRENT_DIRECTORY)/bitdefender
	@docker build --tag=cloudcss/av-clamav $(CURRENT_DIRECTORY)/clamav
	@docker build --tag=cloudcss/av-comodo $(CURRENT_DIRECTORY)/comodo
	@docker build --tag=cloudcss/av-drweb $(CURRENT_DIRECTORY)/drweb
	@docker build --tag=cloudcss/av-escan $(CURRENT_DIRECTORY)/escan
	@docker build --tag=cloudcss/av-fprot $(CURRENT_DIRECTORY)/fprot
	@docker build --tag=cloudcss/av-f-secure $(CURRENT_DIRECTORY)/f-secure

build-no-cache: config
	@docker build --no-cache --tag=cloudcss/av-avast $(CURRENT_DIRECTORY)/avast
	@docker build --no-cache --tag=cloudcss/av-avg $(CURRENT_DIRECTORY)/avg
	@docker build --no-cache --tag=cloudcss/av-avira $(CURRENT_DIRECTORY)/avira
	@docker build --no-cache --tag=cloudcss/av-bitdefender $(CURRENT_DIRECTORY)/bitdefender
	@docker build --no-cache --tag=cloudcss/av-clamav $(CURRENT_DIRECTORY)/clamav
	@docker build --no-cache --tag=cloudcss/av-comodo $(CURRENT_DIRECTORY)/comodo
	@docker build --no-cache --tag=cloudcss/av-drweb $(CURRENT_DIRECTORY)/drweb
	@docker build --no-cache --tag=cloudcss/av-escan $(CURRENT_DIRECTORY)/escan
	@docker build --no-cache --tag=cloudcss/av-fprot $(CURRENT_DIRECTORY)/fprot
	@docker build --no-cache --tag=cloudcss/av-f-secure $(CURRENT_DIRECTORY)/f-secure

config: nodejs
	@echo Copy CONFIG files to NODEJS folders
	@cp $(CURRENT_DIRECTORY)/_config/avast/config.json $(CURRENT_DIRECTORY)/avast/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/avg/config.json $(CURRENT_DIRECTORY)/avg/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/avira/config.json $(CURRENT_DIRECTORY)/avira/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/bitdefender/config.json $(CURRENT_DIRECTORY)/bitdefender/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/clamav/config.json $(CURRENT_DIRECTORY)/clamav/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/comodo/config.json $(CURRENT_DIRECTORY)/comodo/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/drweb/config.json $(CURRENT_DIRECTORY)/drweb/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/escan/config.json $(CURRENT_DIRECTORY)/escan/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/fprot/config.json $(CURRENT_DIRECTORY)/fprot/_nodejs/config.json
	@cp $(CURRENT_DIRECTORY)/_config/f-secure/config.json $(CURRENT_DIRECTORY)/f-secure/_nodejs/config.json

nodejs:
	@echo Copy NODEJS working folders
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/avast/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/avg/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/avira/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/bitdefender/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/clamav/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/comodo/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/drweb/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/escan/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/fprot/
	@cp -r $(CURRENT_DIRECTORY)/_nodejs $(CURRENT_DIRECTORY)/f-secure/

clean:
	@rm -r ./*/_nodejs >> /dev/null 2>&1
	@echo Clean-Up done

.PHONY: build build-no-cache clean