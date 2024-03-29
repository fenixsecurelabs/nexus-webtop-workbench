## Underground Nexus - Linux Webtop Ubuntu MATE - Workbench
> Current Version v0.2.0

Latest images

`docker pull phoenixvlabs/nexus-webtop-workbench:amd64-latest`

or

`docker pull phoenixvlabs/nexus-webtop-workbench:arm64-latest`

Signed images and its digest for verification. (v0.1.0)

Each of these images have SBOM generated and attached for attestation.

```bash
# Make sure the digest signature matches
pyrrhus/webtop-workbench:amd64-latest
pyrrhus/webtop-workbench:sha256-a035907f5f36475eb1c567da358eeda4e4d785a0dae3cbe975e973b954ee609d.sig

# You can use COSIGN_EXPERIMENTAL=1
COSIGN_EXPERIMENTAL=1 cosign download sbom pyrrhus/webtop-workbench:amd64-latest --output-file <NEWFILE>.spdx

# Verify the attestation of the file as well
COSIGN_EXPERIMENTAL=1 cosign verify-attestation pyrrhus/webtop-workbench:amd64-latest --output-file <NEWFILE>.att

Verification for pyrrhus/webtop-workbench:amd64-latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
Certificate subject:  pullmana8@gmail.com
Certificate issuer URL:  https://github.com/login/oauth

# Do the same for ARM64
pyrrhus/webtop-workbench:arm64-latest
pyrrhus/webtop-workbench:sha256-74b016dbb581707d21bd1be7e052422e90eb2fe175dbb98ece864e46f43107b5.sig

COSIGN_EXPERIMENTAL=1 cosign download sbom pyrrhus/webtop-workbench:arm64-latest --output-file <NEWFILE>.spdx

COSIGN_EXPERIMENTAL=1 cosign download attestation pyrrhus/webtop-workbench:arm64-latest --output-file <NEWFILE>.att
```

Signed images and its digest for verification. (v0.0.1). Please note don't attempt to check, as this was just for testing purposes.

```bash
pyrrhus/webtop-workbench:amd64-latest
pyrrhus/webtop-workbench:sha256-112a14044529a8fa2c18ecc461165ba6a8a2c00beeecf9777197adc3d47fa419.sig
```

**Docker Image Building Workflow**

Registries:
1. Dockerhub (pyrrhus/webtop-workbench)
2. Azure Container Registry
3. GitLab Container Registry (coming soon)
4. GitHub Container Registry (coming soon)

**Experimental**

There are two workflows that build and push new docker images in `linux/amd64` and `linux/arm64`. Each of the newly built docker image are signed with `Cosign`. As I work towards automating the process, each signed image with also contain attestation as well for verification, and a generated SBOM. At this time, there are different private keys being used with `Cosign` to sign the images. At this time, I will be experimenting if there is a way to sign the docker images with just one private key.

This is a Linux webtop from `linuxserver`, which consists of Ubuntu MATE Desktop. It's component is termed `workbench` within the Underground Nexus project. Currently, it houses `Terraform` which is an easy infrastructure as code tool for you to use from the virtual desktop. At this GitHub Desktop is not available in `arm64` version, only `amd64` version. This virtual desktop also comes preinstalled with `libvirtd` which gives you the capability to create virtual machines using `qemu/kvm` technology.

**GitHub Actions Workflows**

1. Build and create docker images to push to several different container registries
2. Use `trivy` to scan the docker images and upload `SARIF` reports.