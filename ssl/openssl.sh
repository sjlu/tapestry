#!/bin/bash
cat << EOF | openssl req -new -key server.key -out server.csr
--
New York
New York
Noise Marketing, LLC.
Development
.
noise-dev@noisenewyork.com


EOF
