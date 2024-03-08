#FROM registry.access.redhat.com/ubi9/s2i-core:1-474
FROM registry.access.redhat.com/ubi9/python-39:1-172

USER root

ENV TEKTON_VERSION=0.35.1

RUN INSTALL_PKGS="git unzip wget which" && \
  yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
  rpm -V $INSTALL_PKGS && \
  yum -y clean all --enablerepo='*'

# Upgrade Pip
#RUN pip list
#RUN python3.9 -m pip3 install --upgrade pip3

# Create a Python virtual environment for use by any application
#RUN python3.9 -m venv ${APP_ROOT} && \
#  chown -R 1001:0 ${APP_ROOT} && \
#  fix-permissions ${APP_ROOT} -P && \
#  rpm-file-permissions

# Install the GitHub CLI 'gh'
RUN dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && \
  dnf -y install gh

# Install Kubectl CLI 'kubectl'
# see https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl

# Install the Tekton CLI 'tkn'
# see https://tekton.dev/docs/cli/
RUN curl -LO "https://github.com/tektoncd/cli/releases/download/v{TEKTON_VERSION}/tkn_${TEKTON_VERSION}_Linux_x86_64.tar.gz" && \
  tar xvzf tkn_${TEKTON_VERSION}_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn && \
  chmod +x /usr/local/bin/tkn && \
  rm tkn_${TEKTON_VERSION}_Linux_x86_64.tar.gz

# Install the Argo CD CLI 'argocd'
# see https://argo-cd.readthedocs.io/en/stable/cli_installation/
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
  chmod +x /usr/local/bin/argocd

# Add custom scripts / code
COPY ./scripts ${APP_ROOT}/src

RUN which pip

# Install python dependencies
RUN ${APP_ROOT}/bin/pip install -r ${APP_ROOT}/src/requirements.txt

USER 1001