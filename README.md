# Developer Hub Templates

Install and configure the Developer Hub Infrastructure

## TL;DR

### Install the operators

Subscribe to the operators:

```shell
make install-operators
```

Verify that the default GitOps instance is up-and-running:

```shell
oc get pods -n openshift-gitops
```

### Bootstrap the default Software Factory apps

```shell
make bootstrap
```

### Access Red Hat GitOps

Extract the Red Hat GitOps admin password:

```shell
oc extract secret/openshift-gitops-cluster -n openshift-gitops --to=-
```

Get the Red Hat GitOps routes:

```shell
oc get route openshift-gitops-server -n openshift-gitops
```

**Note:** Login with `Username` and `Password` and not with SSO ! 


### Access the Quay Container Registry

