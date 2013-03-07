#!/bin/bash

. tools/constants.sh

fs=`find $1 -name *xml`

for f in $fs
do
    of=tmp/lexcheck.`basename $f`.txt
    echo $f to $of
    java  -jar ${JARDIR}/${SAXON} \
	-xi \
	-s:$f \
	-o:$of \
	-xsl:tools/lexcheck.xsl \
	f=$f;
done
