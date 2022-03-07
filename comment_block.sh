#!/bin/bash
echo "Hello,"
:<<'COMMENT'
echo "code 1"
echo "code 2"
echo "code 3"
COMMENT
echo "World!"