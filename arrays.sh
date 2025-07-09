#!/bin/bash

# this is called array, instead of single value it can hold multiple values

persons=("ramesh" "suresh" "amla")

echo "first person: ${persons[0]}"
echo " all personss: ${persons[@]}"