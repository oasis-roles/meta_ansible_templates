#!/bin/bash
set -ex

workspace="$(pwd)"
# Create the Ansible structure
mkdir -p ansible_collections
cd ansible_collections

# Tests basic sanitation, that it will initialize the skeleton
ansible-galaxy collection init --collection-skeleton "${workspace}/collection" test_ns.test_collection
cd test_ns/test_collection

# Setup the tests directory
git init .
chmod +x setup.sh
./setup.sh

# Create a test role
cd roles
ansible-galaxy init --role-skeleton "${workspace}/role" test_role
echo "
def test_true(host):
    assert 1 == 1" > test_role/molecule/docker/tests/test_null.py

# Run molecule
cd ..
tox -e lint_all
tox --ansible-driver docker
