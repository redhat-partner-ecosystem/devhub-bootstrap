# Developer Hub Templates

Install and configure a basic Developer Hub Infrastructure. The following Red Hat products are used:

* Red Hat OpenShift Dev Spaces
* Red Hat Developer Hub (WIP)
* Red Hat OpenShift GitOps
* Red Hat OpenShift Pipelines
* Red Hat Quay

## TL;DR

### Prerequisites

* You are logged in to the OCP using the OpenShift CLI
* A GitHub OAuth application. See ["Setting up the GitHub OAuth App"](https://access.redhat.com/documentation/en-us/red_hat_openshift_dev_spaces/3.11/html/administration_guide/configuring-devspaces#configuring-oauth-2-for-github-setting-up-the-github-oauth-app)

### Installation

#### Preparation

Make a copy of file `ansible/inventory/main.yml.example` and rename it to `ansible/inventory/main.yml`. Review the file and change the values according to your environment.

#### Run the bootstrap playbook

Make sure you are logged into OCP using the OpenShift CLI. Execute the playbook:

```shell
make bootstrap
```

This might take several minutes to complete.

## Access Red Hat GitOps

Extract the Red Hat GitOps admin password:

```shell
oc extract secret/openshift-gitops-cluster -n openshift-gitops --to=-
```

Get the Red Hat GitOps routes:

```shell
oc get route openshift-gitops-server -n openshift-gitops
```

**Note:** Login with `Username` and `Password` and not with OpenShift SSO ! 


## References

* https://access.redhat.com/documentation/en-us/red_hat_quay/3.10
* https://access.redhat.com/documentation/en-us/red_hat_openshift_dev_spaces/3.11
* https://access.redhat.com/documentation/en-us/red_hat_developer_hub/1.0
* https://access.redhat.com/documentation/en-us/red_hat_plug-ins_for_backstage/2.0


