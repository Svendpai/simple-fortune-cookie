#!/bin/bash
docker-compose up -d --remove-orphans

for i in {1..20}
do
    code=$(curl -s -o /dev/null -w "%{http_code}" localhost:8080)
    echo $code

    if [ $code == 200 ]
    then
        #Page exists
        echo "pages exists"
        exit 0
    fi
    sleep 2
done

docker-compose down