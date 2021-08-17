# SyntheticNetworks_comparison
Comparison of the packages SyntheticNetworks.jl and SyntheticNetworks-python.py

To get the ensemble of 1000 networks in Julia and Python, first run the julia file Julia/syntheticNetworks.jl, which writes the statistics to the text file julia_networks.txt. Afterwards the bash script must be executed in the Python folder: 

chmod u+x bash.sh
./bash.sh

which writes the data to the text file python_networks.txt. 

This is a slightly longer process, as the statistics and other information about the networks are printed to the command line.

Finally you have 2 text files: julia_networks.txt and python_networks.txt.
In both text files there are 4 columns, where each column stands for the following statistics:
1st column: average node degree
2nd column: assortativity
3rd column: average shortest path length
4th column: global clustering coefficient

The text files can then be plotted with plot.py, whereby the columns for the individual statistics must be specified again and the headings of the plots must be adapted.
