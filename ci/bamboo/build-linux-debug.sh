#!/bin/bash
# ----------------------------------------------------------------------
# Numenta Platform for Intelligent Computing (NuPIC)
# Copyright (C) 2016, Numenta, Inc.  Unless you have purchased from
# Numenta, Inc. a separate commercial license for this software code, the
# following terms and conditions apply:
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Affero Public License for more details.
#
# You should have received a copy of the GNU Affero Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# http://numenta.org/licenses/
# ----------------------------------------------------------------------

# ASUMPTIONS: Expects a pristine htmresearch-core source tree without any remnant
#             build artifacts from prior build attempts. Otherwise, behavior is
#             undefined.
#
# OUTPUTS: see htmresearch-core/ci/build-and-test.sh


set -o errexit
set -o xtrace

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Run the common setup
${DIR}/setup-dependencies-linux.sh

# Install the Include What You Use tool used by debug build
apt-get install -y iwyu

# Build and test
PIP_USER=1 \
BUILD_TYPE="Debug" \
  ${DIR}/../build-and-test.sh "$@"
