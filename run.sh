#!/usr/bin/env bash

set -e

conan install . -s arch=x86_64

source ./activate.sh

premake5 gmake

make config=release_x64
