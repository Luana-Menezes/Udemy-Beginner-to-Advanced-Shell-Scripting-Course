#!/bin/bash

for runlevel in 0 1 2 3 4
    do
    mkdir rc${runlevel}.d
    echo $runlevel
    done