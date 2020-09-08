#!/bin/sh

for i in {1..60}; do
    echo "Request #$i ..."
    curl 'https://tvr.com.mx/transportec/getListadoRutasPantalla' -X POST -o "resp$i.txt"
    sleep 60
done
