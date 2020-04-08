FROM python:3.7-slim
MAINTAINER "OliasInc"

ARG CLI_VERSION=1.18.33
ARG TF_VERSION=0.12.24
ARG TG_VERSION=v0.23.2
ARG K8CTL_VERSION=v1.18.0

ADD https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip /usr/local/bin/terraform.zip
ADD https://github.com/gruntwork-io/terragrunt/releases/download/${TG_VERSION}/terragrunt_linux_amd64 /usr/local/bin/terragrunt
ADD https://storage.googleapis.com/kubernetes-release/release/${K8CTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN apt update && apt install -y git unzip && pip install awscli==${CLI_VERSION} && \
    cd /usr/local/bin && unzip /usr/local/bin/terraform.zip && rm /usr/local/bin/terraform.zip && \
    chmod +x /usr/local/bin/terraform && chmod +x /usr/local/bin/terragrunt && chmod +x /usr/local/bin/kubectl

WORKDIR /usr/local/bin/

ENTRYPOINT []
