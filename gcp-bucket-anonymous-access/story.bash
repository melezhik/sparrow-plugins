#!/bin/bash

set -e
bucket=$(config bucket)
gsutil defacl ch -u AllUsers:R gs://$bucket
