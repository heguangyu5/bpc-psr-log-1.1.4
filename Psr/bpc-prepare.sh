#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Psr
rsync -a                        \
      --exclude=".*"            \
      -f"+ */"                  \
      -f"- *"                   \
      .                         \
      ./Psr
for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Psr/$i
        else
            echo "cp       $i"
            cp $i ./Psr/$i
        fi
    fi
done
cp bpc.conf $1 Makefile ./Psr/
