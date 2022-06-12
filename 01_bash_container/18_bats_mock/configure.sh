#!/usr/bin/env bash
echo "executing configure.sh"

which bats

git clone https://github.com/bats-core/bats-support test/test_helper/bats-support
git clone https://github.com/bats-core/bats-assert test/test_helper/bats-assert  
git clone https://github.com/grayhemp/bats-mock test/test_helper/bats-mock

./run_tests.sh
