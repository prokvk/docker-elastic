#! /bin/bash

exec /usr/bin/docker run --rm  --name elastic -p 9200:9200 -p 9300:9300  -v /usr/local/src/elastic_data:/usr/share/elasticsearch/data elastic