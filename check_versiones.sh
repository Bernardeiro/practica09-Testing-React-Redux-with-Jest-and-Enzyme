#!/bin/bash

FICHERO="versiones.txt"

echo -e "\n== Jenkins version ==" >> $FICHERO
curl -s http://localhost:8080/api/json | grep '"version"' >> $FICHERO

echo "Versiones guardadas en $FICHERO"
