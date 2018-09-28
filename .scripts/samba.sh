#!/bin/bash

docker rm -f samba

docker run --name samba -d \
  -p 137:137 \
  -p 139:139 \
  -p 445:445 \
  -v /:/data \
  --network host \
  --restart always \
  dperson/samba \
    -n \
    -s "Data;/data;yes;no"

docker logs -f samba

