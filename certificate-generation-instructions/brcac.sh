#!/bin/bash

openssl req -new -newkey rsa:2048 -nodes -out brcac.csr -keyout brcac.key -config ./brcac.cnf && cat brcac.csr
