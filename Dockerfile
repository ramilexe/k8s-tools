FROM alpine

ARG KUSTOMIZE_VER="v3.8.0"
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64.tar.gz .
RUN tar xzvf kustomize_${KUSTOMIZE_VER}_linux_amd64.tar.gz && \
    chmod +x ./kustomize && mv ./kustomize /usr/local/bin/kustomize && \
    apk add git
