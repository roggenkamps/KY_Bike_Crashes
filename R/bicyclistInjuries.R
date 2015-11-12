library(httr)
library(readr)

sparqlEndpoint <- "http://localhost:8890/sparql/"

sparqlQuery <- paste("SELECT (COUNT(?person) as ?crashes) ?injury ?injdesc\n",
                     "FROM <http://steveroggenkamp.com/kycrashdata/>\n",
                     "WHERE { ?person <a:persontype>     ?ptype .\n",
                     "?ptype  <a:description>    \"BICYCLIST\" .\n",
                     "?person <a:injurySeverity> ?injury .\n",
                     "?injury <a:description>    ?injdesc .\n",
                     "}\n",
                     "GROUP By ?injury ?injdesc\n",
                     "ORDER BY ?injury ?injdesc" )

out <- POST( sparqlEndpoint,
             encode="multipart",
             body=list( query=sparqlQuery),
             verbose(TRUE),
             add_headers( Accept="text/csv" )
           )

data <- read_csv(rawToChar(out$content))

plot( data$crashes, 
     ylab="# of crashes",
     xlab="Injury Severity",
     main="Bicyclist injury severity",
     axes=FALSE)
axis(2)
axis(1,1:length(data$injdesc),data$injdesc)
