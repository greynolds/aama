#!/bin/bash
# usage:  fupost "dir"
# examples:
#    aama/$ tools/fupost "data/*" --  loads everything
#    aama/$ tools/fupost "data/alaaba" -- loads only alaaba
#    aama/$ tools/fupost "data/alaaba data/burji data/coptic" -- loads all 3 datasets
#    aama/$ tools/fupost "schema" -- loads all 3 datasets
# cumulative logfile written to logs/fupost.log
# each lang/var gets its own logfile

echo "fupost.log" > logs/fupost.log;
for f in `find $1 -name *.rdf`
do
    l=${f%.rdf}
    lang=${l#data/}
    langpath=`dirname ${lang/\/\///}`
    ll=`echo $langpath | tr '[:lower:]' '[:upper:]'`
    graph="http://oi.uchicago.edu/GRAPH/AAMA/$ll"
    echo posting $f to $graph;
    s-post -v http://localhost:3030/aama/data $graph  $f 2>&1 >>logs/fupost.log
done
