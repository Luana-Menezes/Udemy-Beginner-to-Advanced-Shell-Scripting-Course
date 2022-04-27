#!/bin/bash

MinhaFuncao(){
    VARIAVEL=$1;
    if test "$VARIAVEL" -gt 10
        then
            echo "is bigger than 10"
    elif test "$VARIAVEL" -eq 10
        then
            echo "is equal to 10"
    else 
        echo "is less than 10"
    fi
}

MinhaFuncao $1
