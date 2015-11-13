library(httr)
library(readr)

sparqlEndpoint <- "http://localhost:8890/sparql/"

sparqlQuery <-"SELECT ?age (COUNT(?age) as ?number)\
FROM <http://steveroggenkamp.com/kycrashdata/>\
WHERE { ?person <a:persontype>     ?ptype .\
        ?ptype  <a:description>    \"BICYCLIST\" .\
        ?person <a:personAge>      ?age .\
      }\
GROUP By ?age ?number\
ORDER BY ?age ?number"

reply <- POST( sparqlEndpoint,
               encode="multipart",
               body=list( query=sparqlQuery),
               verbose(TRUE),
               add_headers( Accept="text/csv" )
             )

data <- read_csv(rawToChar(reply$content))

plot( data$age,
      data$number,
      type='h',
      ylab="Number",
      xlab="Age",
      main="Bicyclist age")
