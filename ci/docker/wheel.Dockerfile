# syntax=docker/dockerfile:1.3-labs
FROM cr.ray.io/rayproject/manylinux

ARG PYTHON_VERSION=3.9
ARG ARCH_SUFFIX=""
ARG BUILDKITE_BAZEL_CACHE_URL

ENV PYTHON_VERSION=$PYTHON_VERSION
ENV ARCH_SUFFIX=$ARCH_SUFFIX
ENV BUILDKITE_BAZEL_CACHE_URL=$BUILDKITE_BAZEL_CACHE_URL

RUN mkdir /ray

WORKDIR /ray

COPY . .

RUN <<EOF
#!/bin/bash

set -euo pipefail

bazelisk build //:ray_pkg_zip

EOF