VERSION = 1.0.0

.PHONY: bootstrap
bootstrap:
	ansible-playbook -i ansible/inventory/ ansible/playbooks/bootstrap.yml