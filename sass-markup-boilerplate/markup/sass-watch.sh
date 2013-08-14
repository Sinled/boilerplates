#!/bin/sh

cd $(dirname "${0}")\
    && sass --compass --sourcemap --watch styles:css\
    && echo DONE\
    && exit

echo FAILURE >&2
exit 1
