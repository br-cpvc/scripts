#!/usr/bin/env python3
import crypt,getpass;
print(crypt.crypt(getpass.getpass(), crypt.mksalt(crypt.METHOD_SHA512)))
