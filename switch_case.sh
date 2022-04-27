#!/bin/bash

MinhaFuncao(){
    case $1 in
        10) echo "is 10";;
        9) echo "is 9";;
        7|8) echo "is 7 or 8";;
        *) echo "is less than 6 or bigger than 10";;
    esac
}

MinhaFuncao $1

