#!/bin/bash

echo "postar.log" > logs/postar.log;
for f in `ls $1.rdf`
do
    l=${f%.rdf}
    lang=${l#schema/}
    graph="http://oi.uchicago.edu/aama/Arabic"
    echo posting $f to $graph;
    s-post -v http://localhost:3030/aama/data $graph  $f 2>&1 >>logs/postar.log
done
