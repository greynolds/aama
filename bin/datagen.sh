#!/bin/bash
# usage:  datagen.sh "dir"

. bin/constants.sh

for d in `ls -d $1`
do
    # echo "$d ********************************************"
    for f in `find $d -name "*xml"`
    do
	lang=${f%\.xml}
	echo "generating ${f%-pdgms\.xml}.data.ttl  from  $f "
	# set -x;
	java  -jar ${JARDIR}/${SAXON} \
	    -xi \
	    -s:$f \
	    -o:${f%-pdgms\.xml}.data.ttl \
	    -xsl:bin/xml2data.xsl \
	    lang=`dirname ${f#data/}`;
	# set +x;
    done
done
