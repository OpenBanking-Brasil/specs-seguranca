#!/bin/bash

openssl req -new -utf8 -newkey rsa:2048 -nodes -out brcac.csr -keyout brcac.key -config ./brcac.cnf && cat brcac.csr
