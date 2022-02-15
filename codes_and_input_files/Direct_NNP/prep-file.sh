#!/bin/bash

for ((i=1 ; 1001 - $i ; i++))
	do
	mkdir $i/
	cp pbe.cp2k submit.sh $i/
	mv $i-cp2k.xyz $i/
	cd $i/
	sed -i "s/XXX/$i-cp2k.xyz/g" pbe.cp2k
	sed -i "s/XXX/$i/g" submit.sh
	cd ../
done


