#!/bin/bash

echo 'diretorio list'
DIRS=`find . -maxdepth 3 -type d`

LIBRARY_PATH=``

echo 'inicio do for'
for DIR in $DIRS
do
LIBRARY_PATH=`$LIBRARY_PATH:$DIR`
echo $LIBRARY_PATH
done

echo $LIBRARY_PATH

echo 'expor LD_LIBRARY_PATH'
export LD_LIBRARY_PATH=$LIBRARY_PATH

#export LD_LIBRARY_PATH=$script_dir:$script_dir/infraestrutura:$script_dir/wms_cd:$script_dir/infrastructure/interface:$script_dir/infrastructure/log:$script_dir/infrastructure/mvc:$script$

echo 'start'
${script_dir}/gmcorewmscd/gmcorewmscd wms_cd_webservice