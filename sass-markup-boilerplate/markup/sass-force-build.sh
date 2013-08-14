#!/bin/sh

cd $(dirname "${0}")\
    && sass --compass --update --force styles:css --style compressed\
    && echo DONE\
    && exit

echo FAILURE >&2
exit 1
