#!/bin/bash

myFunction(){
    echo "Im learning $2"$1
}

myFunction2(){
    echo "Im learning $@"
}

myFunction3(){
    echo "$@ parameter(s)"
}

myFunction4(){
    echo "Im passing $# parameters"
    return 
    echo "another thing"
}

myFunction5(){
    globalVar="global"
    local localVar="local"
}

myFunction $1 $2
myFunction2 $@
myFunction3 $#

#return value
echo $?

myFunction4

myFunction5
echo $globalVar
echo $localVar
