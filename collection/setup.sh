#!/bin/bash
me="$(readlink -f "${0}")"
home="$(dirname "${me}")"

cd "${home}"
git submodule add https://github.com/oasis-roles/meta_test tests

rm "${me}"
