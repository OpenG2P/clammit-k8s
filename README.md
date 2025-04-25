# Clammit K8s Deployment

This repository contains scripts, charts & instructions for installing Clammit and ClamAV on Kubernetes.

[ClamAV](https://docs.clamav.net/) is an opensource antivirus software.

[Clammit](https://github.com/ifad/clammit) is a HTTP filter that works which works using ClamAV.

## Installation

- For Helm installation/upgrading, run the following. This methods installs both clamav and clammit.
  ```sh
  helm repo add openg2p https://openg2p.github.io/openg2p-helm
  helm repo update
  helm -n ns upgrade --install clammit openg2p/clammit
  ```

## Docker build

- Run
  ```sh
  git clone --recurse-submodules https://github.com/openg2p/clammit-k8s
  cd clammit-k8s
  docker build . -t clammit
  ```

## Licenses

This repository is licensed under [MPL-2.0](LICENSE).
