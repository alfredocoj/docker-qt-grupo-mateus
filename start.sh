#!/bin/bash

script_dir=$(pwd)
echo $script_dir
echo ${script_dir}

DIRS=`ls -l $script_dir | egrep '^d' | awk '{print $9}'`
export LD_LIBRARY_PATH=$script_dir

echo
for DIR in $DIRS
do
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:$script_dir/${DIR}
done

#export LD_LIBRARY_PATH=$script_dir:$script_dir/infraestrutura:$script_dir/wms_cd:$script_dir/infrastructure/interface:$script_dir/infrastructure/log:$script_dir/infrastructure/mvc:$script_dir/infrastructure/network/networkwebservice:$script_dir/infrastructure/services:$script_dir/infrastructure/network/networkwebservice:$script_dir/wms_cd_integracao:$script_dir/seguranca:$script_dir/infrastructure/core:$script_dir/infrastructure/db:$script_dir/infrastructure/3rdparty/qtwebapp:$script_dir/infrastructure/network

${script_dir}/gmcorewmscd/gmcorewmscd wms_cd_webservice