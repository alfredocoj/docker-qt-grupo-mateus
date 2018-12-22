#!/bin/bash

echo 'encontrando os diretorios do projeto\n'
DIRS=`find . -type f -name '*lib*' | sed -r 's|/[^/]+$||' |sort -u`

echo 'varrendo diretorios ...\n'
count=1
for DIR in $DIRS
do
if [ $count -gt 1 ] ; then
    path=$DIR
    count=2
else
    path=$path:$DIR
fi
done

echo 'diretorios encontrados...\n'
echo $path

echo 'export LD_LIBRARY_PATH\n'
export LD_LIBRARY_PATH=$path

echo 'start\n'
$(pwd)/gmcorewmscd/gmcorewmscd wms_cd_webservice