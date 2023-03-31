#!/usr/bin/env bash
# from: https://gist.github.com/maximlarionov/d24d57990b3c6ce04e36
# brew install oath-toolkit

oathtool --totp -b "$1"
