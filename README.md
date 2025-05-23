# Clammit K8s Deployment

This repository contains scripts, charts & instructions for installing Clammit on Kubernetes.

[Clammit](https://github.com/ifad/clammit) is a HTTP filter that works which works using ClamAV.

[ClamAV](https://docs.clamav.net/) is an opensource antivirus software.

## Installation

ClamAV is required to be installed for the following to work.
Refer to [OpenG2P Docs](https://docs.openg2p.org).

- Helm upgrade/install.
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
