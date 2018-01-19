#!/bin/bash

## change to this directory
this_dir="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
pushd $this_dir 2>&1 > /dev/null

# export the profile to use
export AWS_PROFILE=test

# use the ec2.ini in cwd
export EC2_INI_PATH=./ec2.ini

# call ec2.py
../../ec2.py
popd 2>&1 > /dev/null
