#!/bin/bash
srcdir=$1
dstdir=$2
pct=$3
#N=$3;
N=$(ls $srcdir | wc -l)
NP=$(printf %.0f $(echo "$N*$pct" | bc -l))
echo $NP
for i in "${srcdir}"/neg*; do
  [ "$((NP--))" = 0 ] && break
  mv -t "${dstdir}" -- "$i"
done
