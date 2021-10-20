IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-nxlog-2004:
	bash scripts/deploy-nxlog-2004.sh

deploy-nxlog-1804:
	bash scripts/deploy-nxlog-1804.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
