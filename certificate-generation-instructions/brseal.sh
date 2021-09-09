#!/bin/bash

openssl req -new -newkey rsa:2048 -utf8 -nodes -out brseal.csr -keyout brseal.key -config ./brseal.cnf && cat brseal.csr
