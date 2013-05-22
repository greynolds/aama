#!/bin/bash
# delete fuseki graphs
# usage:  fuclear <arg>
# <arg> ==  DEFAULT | NAMED | ALL | IRIref

echo "fuclear.log" > logs/fuclear.log;

graph="<http://oi.uchicago.edu/aama/$1>"

echo "clearing graph $graph"
set -x
s-update -v --service http://localhost:3030/aama/update "CLEAR $1" 2>&1 | >> logs/fuclear.log
set +x
