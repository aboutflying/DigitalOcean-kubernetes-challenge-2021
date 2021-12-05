#!/bin/bash
# This script runs terraform-docs recursively
set -eux

SRCROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo -e "\n-- Generating terraform docs --\n"
docker run \
    --rm \
    --volume "${SRCROOT}:/terraform-docs" \
    -u $(id -u) \
    quay.io/terraform-docs/terraform-docs:0.16.0 \
    markdown \
    /terraform-docs --recursive --output-file README.md