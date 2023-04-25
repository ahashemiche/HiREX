#!/bin/bash

for i in $(ls *.xyz)

do

JOB=`basename $i .xyz`

mkdir $JOB

cp $i $JOB/
  cd $JOB

echo -e "%nprocshared=24
%mem=30GB
%chk=$JOB.chk

#p opt b3lyp/6-31g(d,p) guess=save empiricaldispersion=gd3bj integral=grid=ultrafinegrid scf=(tight,xqc,maxconventionalcycles=90)

$JOB

0 2" > $JOB.g16

awk 'NR>2' $i >> $JOB.g16

echo "" >>$JOB.g16

GSUB $JOB.g16

cd ..

done
