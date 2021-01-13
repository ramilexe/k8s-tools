# Kubernetes Tools for CI/CD

## Tools

### [Kustomize](https://github.com/kubernetes-sigs/kustomize)

**Version:** v3.8.0

`kustomize` lets you customize raw, template-free YAML
files for multiple purposes, leaving the original YAML
untouched and usable as is.

### [Argo CD](https://github.com/argoproj/argo-cd/)

**Version:** v1.6.1

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

### [kfilt](https://github.com/ryane/kfilt)

**Version:** v0.0.5

kfilt can filter Kubernetes resources.

## CI examples

### Gitlab

```
deploy:
  stage: deploy
  image: ramilexe/k8s-tools
  script:
    - kustomize edit set image my-image=my-image:"$CI_COMMIT_SHORT_SHA"
    - git add kustomization.yaml
    - git commit -m "Bump dev version to $CI_COMMIT_SHORT_SHA" || echo "No changes, nothing to commit!"
    - git push
    - argocd app sync myappname --async
  only:
    - master
```
