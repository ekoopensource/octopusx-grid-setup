#!/bin/bash


echo "OCTOPUSX GRID DESTRUCTION INTERACTIVE SHELL"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -"


read -p 'Grid Name: ' grid_name

region="eu-west-2"

#set region

export AWS_DEFAULT_REGION=$region

#copy grid state
#./reversecopystate.sh $grid_name

#destroy grid base
./install-grid-base/destroy.sh ${region} ${grid_name}

#return
echo "${grid_name} Destruction Completed!"

