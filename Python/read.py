import numpy as np
import sys


mean = 0.0
path_length = 0.0
clust_coefficient = 0.0
assortativity = 0.0

data = []
counter = 0
with open("networks/random_net0.gml.info", "r") as graph_info:
	for line in graph_info:
		if len(line.split()) != 0:
			if line.split()[0] == "*" and counter == 0:
				mean = float(line.split(":")[1])
				counter += 1
			elif line.split()[0] == "*" and counter == 1:
				path_length = float(line.split(":")[1])
				counter += 1
			elif line.split()[0] == "*" and counter == 2:
				clust_coefficient = float(line.split(":")[1])
				counter += 1
			elif line.split()[0] == "*" and counter == 3:
				assortativity = float(line.split(":")[1])
			


with open("python_networks.txt", "a") as output:
	output.write(str(mean) + "\t" + str(assortativity) + "\t" + str(path_length) + "\t" + str(clust_coefficient) +  "\n")
