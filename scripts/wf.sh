#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: ./<path>/wf.sh command filepath"
    echo ""
    echo "Command: diff, copy"
    echo ""
fi


command=$1
filepath=$2

function show_diff {
    echo "Filepath: $1"
    filea=$1
    fileb=`echo $1 | sed s/exercises/solutions/`
    diff --color -y -W 240 ../rustlings/{$filea,$fileb}
}

function copy_file {
    echo "Filepath: $1"
    cp ../rustlings/$1 $1
}


case $command in 
    ( "diff" ) show_diff $filepath;;
    ( "copy" ) copy_file $filepath;;
esac
