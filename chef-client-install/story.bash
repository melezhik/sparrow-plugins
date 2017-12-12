#!/bin/bash

set -e;

if chef-client --version 2>/dev/null; then
  echo "chef client is already installed, nothing to do here"
else
  curl -skL https://omnitruck.chef.io/install.sh | bash
fi
