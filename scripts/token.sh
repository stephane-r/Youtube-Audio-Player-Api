#!/bin/sh

curl -X POST -H "Content-Type: application/json" 127.0.0.1:1337/auth/local -d '{"identifier":"contact@stephane-richin.fr","password":"azerty"}'
