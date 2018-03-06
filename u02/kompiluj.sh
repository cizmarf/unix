#!/bin/sh
fpc program.pas &> /dev/null
chmod u+x program
./program | grep ' ' | grep [0-9] | head -n 5
rm program.o program
