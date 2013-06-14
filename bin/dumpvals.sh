#!/bin/bash
# usage:  dumpvals.sh "dir"
# IMPORTANT:  use quotes if dir includes a wildcard
# e.g.  dumpvals.sh "data/*"

. bin/constants.sh

for d in `ls -d $1`
do
    # echo "$d ****************************************************************"
    for f in `find $d -name "*xml"`
    do
	echo "dumping propvals of " `dirname ${f#data/}` in tmp/`basename ${f%-pdgms\.xml}`.props
	# set -x;
	java  -jar ${JARDIR}/${SAXON} \
	    -xi \
	    -s:$f \
	    -o:tmp/`basename ${f%-pdgms\.xml}`.vals \
	    -xsl:bin/dumpvals.xsl \
	    lang=${d#data/};
	# set +x;
    done
done
