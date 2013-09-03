# aama-data #

Afro-Asiatic Morphological Archive

# Data #

See http://jena.apache.org/documentation/tools/eyeball-getting-started.html

# Fuseki Administration #

    * fuseki http://jena.apache.org/documentation/serving_data/index.html

A sample fuseki config file is in etc/aamaconfig.ttl.  To use it, copy
it to the fuseki dir, edit, and run

    $ fuseki-server --config aamaconfig.ttl

## Fuseki data administration ##

Use fuseki's [SOH (Sparql Over HTTP) tools](http://jena.apache.org/documentation/serving_data/soh.html "SOH").  The bin subdirectory contains some shell scripts  (prefixed with "fu") to make this easier.

A useful development pattern is to run cycles of

1. fuclear.sh - delete data
2. fupost.sh  - load data
3. fulangs.sh, fugraphs.sh - confirm data was uploaded
4. ... queries ...  - run your queries

### Loading data ###

* fupost.sh uploads data using HTTP POST.  Note that result code "204
  No Content" means success; "no content" means no content is returned
  with the result code, not that no content was uploaded.  **NB**
  *Each language has its own graph uri.  Ex. Oromo data is in the
  graph named by http://oi.uchicago.edu/aama/oromo.

* fuput.sh uses HTTP PUT instead of POST.

### Deleting data ###

See http://www.w3.org/TR/sparql11-update/#clear

* fuclear.sh "clears" (i.e. deletes) triples.

** fuclear.sh DEFAULT clears the default graph.
** fuclear.sh NAMED clears all named graphs.
** fuclear.sh <IRIref> clears the graph associated with the IRIref.
** fuclear.sh ALL is the nuclear option; it clears everything.

## Querying the triplestore ##

* qrylangs.sh returns a list of all languages represented in the store. It runs sparql/langs.rq, which selects everything whose rdf:type is aamas:Language.
