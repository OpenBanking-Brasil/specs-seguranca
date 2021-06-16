#!/bin/bash

openssl req -new -newkey rsa:2048 -sha1 -nodes -out brseal.csr -keyout brseal.key -config ./brseal.cnf && cat brseal.csr
