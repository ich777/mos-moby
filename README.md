# MOS Moby (Docker)

MOS Moby provides **packaged Docker-related components** for use within the MOS ecosystem.

This repository contains the **build scripts, packaging logic, and configuration files**
required to integrate Docker and its related components into MOS.

---

## Overview

This repository packages multiple Docker ecosystem components for MOS, including
the Docker daemon, CLI tools, and supporting runtime components.

Depending on the component, binaries are either:
- built from upstream source code, or
- obtained from upstream prebuilt packages or repositories.

No functional changes to the Docker components themselves are intended.  
The goal is to provide **consistent and reproducible Docker packages** for MOS installations.

---

## Included Components

The following components are packaged by this repository:

- dockerd (Docker Engine)
- docker-cli
- containerd
- runc
- tini
- docker-buildx
- docker-compose

A detailed overview and upstream references can be found in `THIRD_PARTY.md`.

---

## Licensing

The contents of this repository (build scripts, packaging logic, configuration, and automation)
are licensed under **GPL-3.0**.

Each Docker-related component remains licensed under its respective upstream license.

---

## Third-Party Software

This repository builds and packages third-party open-source software.

Packaged components remain licensed under their original upstream licenses.  
License texts are shipped with the generated packages.
