#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Wrong usage!"
	echo "$0 git_plugin_addr"
	exit 0
fi

cd $(dirname $0)
cd bundle

git submodule add $1
