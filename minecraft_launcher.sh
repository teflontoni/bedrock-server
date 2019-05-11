#!/bin/bash

server=$1
base_dir="/var/games"
work_dir="${base_dir}"/"${server}"

mkdir -p "${work_dir}"

docker run -d -h ${server} --name=${server}\
 -v "${work_dir}:/opt/minecraft:z"\
 --network=host\
 teflontoni/minecraft-bedrockserver
