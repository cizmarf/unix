#!/bin/sh
head -n 1 $1 | tr ';' '\n' | nl -w3 -s ' '
