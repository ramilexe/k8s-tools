FROM alpine:3.17.2

WORKDIR /opt

#ARG ARGOCD_VER="v2.6.3"
#ADD https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VER}/argocd-linux-amd64 .

ARG KFILT_VER="0.0.7"
ADD https://github.com/ryane/kfilt/releases/download/v${KFILT_VER}/kfilt_${KFILT_VER}_linux_amd64 .

ARG KUSTOMIZE_VER="v5.0.0"
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64.tar.gz .
RUN tar xzvf kustomize_${KUSTOMIZE_VER}_linux_amd64.tar.gz && \
    chmod +x ./kustomize && mv ./kustomize /usr/local/bin/kustomize && \
    chmod +x ./kfilt_${KFILT_VER}_linux_amd64 && mv ./kfilt_${KFILT_VER}_linux_amd64 /usr/local/bin/kfilt && \
    apk add --update --no-cache git openssh python3 py3-pip jq && \
    pip3 install yq

