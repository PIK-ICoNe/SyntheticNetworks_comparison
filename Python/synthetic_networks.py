from rpgm_algo import *
from rpgm_core import *
import numpy as np


# create container for a random powergrid graph
g = RPG()
# activate detailed output
g.debug = True 
# set growth parameters
# default values: n = 20, n0 = 10, p = 0.2, q = 0.3, r = 1. / 3., s = 0.1
#g.set_params(n=100, n0=1, r=1./3.) 
# initialize the network with a minimum spanning tree of size n0
g.initialise() 
# perform growth steps until the network has size n
g.grow() 

print(g)

print(g.stats)

g.save_graph()

#g.plot_net() # return kind of error because of pyunicorn ("is not available")







#def average_node_degree(graph)
#	np.sum(g.degree())

