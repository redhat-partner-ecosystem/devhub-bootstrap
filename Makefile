VERSION = 1.0.0

.PHONY: bootstrap
bootstrap:
	oc apply -f pipelines/clustertasks
	ansible-playbook -i ansible/inventory/ ansible/playbooks/bootstrap.yml