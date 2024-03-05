VERSION = 1.0.0
NAMESPACE = devhub

# step 1:
.PHONY: namespaces
namespaces:
	oc new-project ${NAMESPACE}

.PHONY: install-operators
install-operators: install-gitops-operators install-devspaces-operators install-quay-operator

.PHONY: install-gitops-operators
install-gitops-operators:
	oc apply -f operators/openshift-pipeline-operator.yaml
	oc apply -f operators/openshift-gitops-operator.yaml

.PHONY: install-devspaces-operators
install-devspaces-operators:
	oc apply -f operators/openshift-devspaces-operator.yaml

.PHONY: install-quay-operator
install-quay-operator:
	oc apply -f operators/openshift-quay-operator.yaml
	oc apply -f operators/openshift-quay-security-operator.yaml

.PHONY: config-devspaces-operators
config-devspaces-operators:
	#oc apply -f operators/gitea-instance.yaml -n {NAMESPACE}
	oc apply -f operators/openshift-devspaces-instance.yaml -n {NAMESPACE}
	
.PHONY: bootstrap
bootstrap:
	oc apply -f apps/bootstrap/apps.yaml
	ansible-playbook -i ansible/inventory/ ansible/playbooks/bootstrap.yml