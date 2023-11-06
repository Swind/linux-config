#!/bin/bash
#
ssh-keygen -t ed25519 -N '' -C "swind@cloudmosa.com" <<< $'\ny' >/dev/null 2>&1
