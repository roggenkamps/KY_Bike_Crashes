#
# nTriples.R - get the number of triples in a linked-data store
#

library(httr)
library(readr)

sparqlEndpoint <- "http://localhost:8890/sparql/"

sparqlQuery <- "select (count(*) as ?nTriples) \
  from <http://steveroggenkamp.com/kycrashdata/> \
  where { ?s ?p ?o }"
out <- POST( sparqlEndpoint,
             encode="multipart",
             body=list( query=sparqlQuery),
             add_headers( Accept="text/csv; charset=UTF-8" )
           )
data <- read_csv(rawToChar(out$content))
