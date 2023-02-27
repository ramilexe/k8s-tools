# Kubernetes Tools for CI/CD

## Tools

### [Kustomize](https://github.com/kubernetes-sigs/kustomize)

**Version:** v5.0.0

`kustomize` lets you customize raw, template-free YAML
files for multiple purposes, leaving the original YAML
untouched and usable as is.

### [kfilt](https://github.com/ryane/kfilt)

**Version:** v0.0.7

kfilt can filter Kubernetes resources.

### yq (python version)

**Version:** v3.1.1

### kubectl

**Version:** v1.26.1

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
  only:
    - master
```
