#!/bin/bash

cd $DIR_PROJETO_QT

DIRS=`find . -maxdepth 4 -mindepth 1 -type d`

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

echo "ENV PATH de projeto"
echo $path

echo"ENV HOME: "
echo $HOME


echo 'export ENVs LD_LIBRARY_PATH and QT_QPA_PLATFORM_PLUGIN_PATH'
export LD_LIBRARY_PATH=$path:$HOME/qt/libs
export QT_QPA_PLATFORM_PLUGIN_PATH=$HOME/qt/libs
export QT_PLUGIN_PATH=$HOME/qt/plugins
#export ODBCINST=/etc/odbcinst.ini
#export ODBCINI=/etc/odbc.ini


echo $LD_LIBRARY_PATH 

#export LD_LIBRARY_PATH=$script_dir:$script_dir/infraestrutura:$script_dir/wms_cd:$script_dir/infrastructure/interface:$script_dir/infrastructure/log:$script_dir/infrastructure/mvc:$script$

echo 'start...'
$(pwd)/gmcorewmscd/gmcorewmscd wms_cd_webservice
