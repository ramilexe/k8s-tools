FROM alpine

WORKDIR /opt

ARG ARGOCD_VER="v1.6.1"
ADD https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VER}/argocd-linux-amd64 .

ARG KUSTOMIZE_VER="v3.8.0"
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64.tar.gz .
RUN tar xzvf kustomize_${KUSTOMIZE_VER}_linux_amd64.tar.gz && \
    chmod +x ./kustomize && mv ./kustomize /usr/local/bin/kustomize && \
    chmod +x ./argocd-linux-amd64 && mv ./argocd-linux-amd64 /usr/local/bin/argocd && \
    apk add --update --no-cache git openssh
