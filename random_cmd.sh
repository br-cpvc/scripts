#!/usr/bin/env bash
dirs="/usr/bin/ /bin"
man -f $(ls $dirs | shuf | head -n1)
