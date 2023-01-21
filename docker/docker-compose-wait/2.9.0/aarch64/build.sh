#!/bin/bash

version=2.9.0

echo "======================="
echo "= Downloading archive ="
echo "======================="
wget https://github.com/ufoscout/docker-compose-wait/archive/refs/tags/${version}.zip

echo "======================"
echo "= Extracting archive ="
echo "======================"
unzip ${version}

echo "========================"
echo "= Building wait binary ="
echo "========================"
pushd docker-compose-wait-${version}
docker run --rm -v `pwd`:/wait/ -w /wait rust:latest cargo build --release
cp target/release/wait ../
popd

echo "======================"
echo "= Performing cleanup ="
echo "======================"
rm -rf ${version}.zip docker-compose-wait-${version}
