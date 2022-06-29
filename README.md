## Underground Nexus - Linux Webtop Ubuntu MATE - Workbench
> Current Version v0.1.0

Latest images

`docker pull pyrrhus/webtop-workbench:amd64-latest` or `docker pull pyrrhus/webtop-workbench:arm64-latest`

Signed images and its digest for verification. (v0.0.1)

```bash
pyrrhus/webtop-workbench:amd64-latest
pyrrhus/webtop-workbench:sha256-112a14044529a8fa2c18ecc461165ba6a8a2c00beeecf9777197adc3d47fa419.sig
```

**Docker Image Building Workflow**

Registries:
1. Dockerhub
2. Azure Container Registry
3. GitLab Container Registry (coming soon)
4. GitHub Container Registry (coming soon)

**Experimental**

There are two workflows that build and push new docker images in `linux/amd64` and `linux/arm64`. Each of the newly built docker image are signed with `Cosign`. At this time, there are different private keys being used with `Cosign` to sign the images. At this time, I will be experimenting if there is a way to sign the docker images with just one private key.

This is a Linux webtop from `linuxserver`, which consists of Ubuntu MATE Desktop. It's component is termed `workbench` within the Underground Nexus project. Currently, it houses `Terraform` which is an easy infrastructure as code tool for you to use from the virtual desktop. At this GitHub Desktop is not available in `arm64` version, only `amd64` version. This virtual desktop also comes preinstalled with `libvirtd` which gives you the capability to create virtual machines using `qemu/kvm` technology.

**GitHub Actions Workflows**

1. Build and create docker images to push to several different container registries
2. Use `trivy` to scan the docker images and upload `SARIF` reports.