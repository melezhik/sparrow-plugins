#!/bin/bash

set -e

vsts build list -o table | head

