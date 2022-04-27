#!/bin/bash

_INPUT_STRING="Hello"
while  [[ "$_INPUT_STRING" != "bye" ]]
do
    echo "Do you wish to stay here?"
    read _INPUT_STRING
    
    if [[ $_INPUT_STRING = "bye" ]]; then
        echo "you said bye"
    else
        echo "you still wish you were here"
    fi
done