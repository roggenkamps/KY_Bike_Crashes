#!/bin/bash

curl \
  -t 200 \
  -H "Accept: text/csv" \
  -F query=@BicyclistInjuries.rq \
  -F "default-graph-uri=http://steveroggenkamp.com/kycrashdata/" \
  -u demo:demo \
  http://localhost:8890/sparql/

echo
echo

curl \
  -t 200 \
  -H "Accept: text/csv" \
  -F query=@AgeDistribution.rq \
  -F "default-graph-uri=http://steveroggenkamp.com/kycrashdata/" \
  -u demo:demo \
  http://localhost:8890/sparql/

