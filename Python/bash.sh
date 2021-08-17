#!/bin/bash
for i in {1..1000}
do
	python3 synthetic_networks.py
	python3 read.py
done
